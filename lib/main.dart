import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/controller/common_controller.dart';
import 'package:kukelola_flutter/core/helper/LocalesString.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/view/start_view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();
final firebaseMessaging = FirebaseMessaging();
/// PLACE GLOBAL CONTROLLER HERE IF YOU WANT THE CONTROLLER PERSIST ///
final commonController = Get.put(CommonController());

void main() {
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

  @override
  void dispose() {
    _connection?.cancel();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _connection = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile) {
        commonController.setNotConnected(false);
      } else if (result == ConnectivityResult.wifi) {
        commonController.setNotConnected(false);
      } else {
        commonController.setNotConnected(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // this code to make apps to only allows portrait mode //
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return GetMaterialApp(
      title: 'KuKelola',
      navigatorKey: globalNavigatorKey,
      home: StartView(),
      translations: LocalesString(),
      locale: Locale(commonController.language.value),
      fallbackLocale: Locale(Constant.INDONESIAN),
      debugShowCheckedModeBanner: false,
    );
  }
}
