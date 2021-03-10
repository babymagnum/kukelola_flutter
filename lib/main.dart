import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/controller/common_controller.dart';
import 'package:kukelola_flutter/core/helper/LocalesString.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/view/container_home/container_home_view.dart';
import 'package:kukelola_flutter/view/home/home_controller.dart';
import 'package:kukelola_flutter/view/leave_summary/leave_summary_view.dart';
import 'package:kukelola_flutter/view/login/login_view.dart';
import 'package:kukelola_flutter/view/onboarding/onboarding_view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kukelola_flutter/view/verification_code/verification_code_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/helper/text_util.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();
final firebaseMessaging = FirebaseMessaging();
/// PLACE GLOBAL CONTROLLER HERE IF YOU WANT THE CONTROLLER PERSIST ///
final commonController = Get.put(CommonController(), permanent: true);
final homeController = Get.put(HomeController(), permanent: true);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await commonController.initValue();
  commonController.loadLanguage();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  // Don't forget to change BASE_API to Constant.API_PRODUCTION when building apk / when testing live server //
  static const BASE_API = Constant.API_PRODUCTION;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  StreamSubscription _connection, _fcmRefreshToken;

  _connectivityResult(ConnectivityResult result) {
    if (result == ConnectivityResult.mobile) {
      commonController.setNotConnected(false);
    } else if (result == ConnectivityResult.wifi) {
      commonController.setNotConnected(false);
    } else {
      commonController.setNotConnected(true);
    }
  }

  _navigateTo(String redirect) {
    if (redirect == 'main') {
      Get.to(LeaveSummaryView());
    }
  }

  _redirectTo(Map<String, dynamic> message) async {
    final redirect = Platform.isAndroid ? message['data']['type'].toString() ?? '' : message['type'].toString() ?? '';

    _navigateTo(redirect);
  }

  _onSelectNotification(Map<String, dynamic> message) async {
    final redirect = Platform.isAndroid ? message['data']['type'].toString() ?? '' : message['type'].toString() ?? '';
    final showForegroundNotification = commonController.preferences.getBool(Constant.SHOW_FOREGROUND_NOTIFICATION) ?? false;

    if (showForegroundNotification) _navigateTo(redirect);
  }

  _showAndroidNotification(Map<String, dynamic> message) async {
    var androidSetting = AndroidInitializationSettings('kukelola_logo');
    var iosSetting = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(android: androidSetting, iOS: iosSetting);
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: (_) => _onSelectNotification(message));

    String title = message['notification']['title'];
    String body = message['notification']['body'];

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'com.netika.kukelola', 'com.netika.kukelola', 'com.netika.kukelola',
        importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(TextUtil.randomInt(0, 1000), title, body, platformChannelSpecifics);
  }

  _fcmListener() {
    firebaseMessaging.configure(
      /// Android : For now fired when apps is in foreground
      onMessage: (Map<String, dynamic> message) async {
        await commonController.preferences.setBool(Constant.SHOW_FOREGROUND_NOTIFICATION, false);
        if (Platform.isAndroid) await _showAndroidNotification(message);
        print("onMessage: $message");

        // below code is use only in android platform to prevent onmessage called when notification is not clicked
        Future.delayed(Duration(milliseconds: 500), () async => await commonController.preferences.setBool(Constant.SHOW_FOREGROUND_NOTIFICATION, true));

        return Future.value(true);
      },
      /// Android : Fired when notification clicked and the apps is killed
      onLaunch: (Map<String, dynamic> message) async {
        String title = message['notification']['title'] ?? '';

        if (Platform.isAndroid && title != '') await _showAndroidNotification(message);
        print("onLaunch: $message");
        _redirectTo(message);
        return Future.value(true);
      },
      /// Fired when notification clicked and apps is in background
      onResume: (Map<String, dynamic> message) async {
        String title = message['notification']['title'] ?? '';

        if (Platform.isAndroid && title != '') await _showAndroidNotification(message);
        print("onResume: $message");
        _redirectTo(message);
        return Future.value(true);
      },
    );
  }

  _initFCM() async {
    firebaseMessaging.requestNotificationPermissions(IosNotificationSettings(sound: true, badge: true, alert: true, provisional: true));
    firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
    await _getFcmToken();
    _fcmListener();
  }

  _getFcmToken() async {
    final preference = await SharedPreferences.getInstance();

    FirebaseMessaging().getToken().then((String token) async {
      assert(token != null);
      print("FCM_TOKEN $token");
      await preference.setString(Constant.FCM_TOKEN, token);
    });
    _fcmRefreshToken = FirebaseMessaging().onTokenRefresh.listen((newToken) {
      print("NEW_FCM_TOKEN $newToken");
      if (newToken != preference.getString(Constant.FCM_TOKEN)) preference.setString(Constant.FCM_TOKEN, newToken);
    });
  }

  Widget _initView() {
    final isLogin = commonController?.preferences?.getBool(Constant.IS_LOGIN) ?? false;
    final isOnboarding = commonController?.preferences?.getBool(Constant.IS_ONBOARDING) ?? false;
    final isPassLogin = commonController?.preferences?.getBool(Constant.IS_PASS_LOGIN) ?? false;

    if (isLogin) {
      return ContainerHomeView();
    } else if (isPassLogin) {
      return VerificationCodeView();
    } else if (isOnboarding) {
      return LoginView();
    } else {
      return OnboardingView();
    }
  }

  @override
  void dispose() {
    _connection?.cancel();
    _fcmRefreshToken?.cancel();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _initFCM();

    Connectivity().checkConnectivity().then((result) => _connectivityResult(result));

    _connection = Connectivity().onConnectivityChanged
        .listen((ConnectivityResult result) => _connectivityResult(result));
  }

  @override
  Widget build(BuildContext context) {
    // this code to make apps to only allows portrait mode //
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return ScreenUtilInit(
      designSize: Size(360, 640),
      allowFontScaling: true,
      builder: () => GetMaterialApp(
        title: 'KuKelola',
        navigatorKey: globalNavigatorKey,
        home: _initView(),
        translations: LocalesString(),
        locale: Locale(commonController.language.value),
        fallbackLocale: Locale(Constant.INDONESIAN),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
