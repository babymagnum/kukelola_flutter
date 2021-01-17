import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/controller/common_controller.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/view/container_home/container_home_view.dart';
import 'package:kukelola_flutter/view/home/home_view.dart';
import 'package:kukelola_flutter/view/login/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboarding/onboarding_view.dart';

class StartView extends StatefulWidget {
  @override
  _StartViewState createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 300), () async {
      commonController.loadLanguage(context);
      final preference = await SharedPreferences.getInstance();
      final isLogin = preference?.getBool(Constant.IS_LOGIN) ?? false;
      final isOnboarding = preference?.getBool(Constant.IS_ONBOARDING) ?? false;

      Get.off(!isOnboarding ? OnboardingView() : !isLogin ? LoginView() : ContainerHomeView());
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints.tight(Size(360, 640)), allowFontScaling: true);

    return Scaffold(
      body: Container(
        width: Get.width, height: Get.height, color: Color(0xFFFAFAFA),
      ),
    );
  }
}
