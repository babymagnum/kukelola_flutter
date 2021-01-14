import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/controller/common_controller.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/view/start_view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

final globalNavigatorKey = GlobalKey<NavigatorState>();
final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

class MyApp extends StatefulWidget {

  // Don't forget to change BASE_API to Constant.API_PRODUCTION when building apk / when testing live server //
  static const BASE_API = Constant.API_PRODUCTION;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  StreamSubscription _connection;
  CommonController _commonController = Get.put(CommonController());

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
        _commonController.setNotConnected(false);
      } else if (result == ConnectivityResult.wifi) {
        _commonController.setNotConnected(false);
      } else {
        _commonController.setNotConnected(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // this code to make apps to only allows portrait mode //
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);

    return GetMaterialApp(
      title: 'Satu Pos',
      navigatorKey: globalNavigatorKey,
      home: StartView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
