import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/view/login/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onboarding3 extends StatelessWidget {

  Onboarding3({@required this.item});

  final OnboardingItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Align(
                child: Image.asset('assets/images/kukelola_logo.png', width: Get.width * 0.45, height: Get.height * 0.4, fit: BoxFit.contain,),
                alignment: Alignment.topCenter,
              ),
              Positioned(
                left: 0, right: 0, bottom: 0,
                child: Image.asset('assets/images/onboarding3_leaves.png', width: Get.width, height: Get.height * 0.3, fit: BoxFit.fitWidth,),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(item.title, style: ThemeTextStyle.biryaniBold.apply(fontSizeDelta: 26.ssp),),
              ),
              SizedBox(height: 10.h,),
              Text(item.description, style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 16.ssp),),
              SizedBox(height: 24.h,),
              ButtonLoading(
                backgroundColor: ThemeColor.primary,
                disable: false,
                title: 'Sign In',
                loading: false,
                textStyle: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 14.ssp),
                onTap: () async {
                  final preference = await SharedPreferences.getInstance();
                  await preference.setBool(Constant.IS_ONBOARDING, true);

                  Get.off(LoginView());
                },
                verticalPadding: 13.h,
              ),
              SizedBox(height: 85.h,)
            ],
          ),
        )
      ],
    );
  }
}
