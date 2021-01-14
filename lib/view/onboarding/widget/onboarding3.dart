import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/view/login/login_view.dart';

class Onboarding3 extends StatelessWidget {

  Onboarding3({@required this.item});

  final OnboardingItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(item.image, width: Get.width * 0.4, height: Get.height * 0.4, fit: BoxFit.contain,)
              ],
            ),
          ),
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
            onTap: () => Get.off(LoginView()),
            verticalPadding: 18.h,
          ),
          SizedBox(height: 85.h,)
        ],
      ),
    );
  }
}
