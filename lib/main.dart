import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/controller/common_controller.dart';
import 'package:kukelola_flutter/core/helper/LocalesString.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/view/container_home/container_home_view.dart';
import 'package:kukelola_flutter/view/home/home_controller.dart';
import 'package:kukelola_flutter/view/login/login_view.dart';
import 'package:kukelola_flutter/view/onboarding/onboarding_view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kukelola_flutter/view/verification_code/verification_code_view.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();
final firebaseMessaging = FirebaseMessaging();
/// PLACE GLOBAL CONTROLLER HERE IF YOU WANT THE CONTROLLER PERSIST ///
final commonController = Get.put(CommonController());
final homeController = Get.put(HomeController());

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

  StreamSubscription _connection;

  _connectivityResult(ConnectivityResult result) {
    if (result == ConnectivityResult.mobile) {
      commonController.setNotConnected(false);
    } else if (result == ConnectivityResult.wifi) {
      commonController.setNotConnected(false);
    } else {
      commonController.setNotConnected(true);
    }
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

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

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
