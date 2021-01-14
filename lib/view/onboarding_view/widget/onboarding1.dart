import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';

class Onboarding1 extends StatelessWidget {

  Onboarding1({@required this.item});

  final OnboardingItem item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Get.width, height: Get.height,
        ),
        Stack(
          children: [
            Positioned(
              left: 0, right: 0, top: 74.h,
              child: SvgPicture.asset('assets/images/onboarding_clock.svg', width: 106.w, height: 106.w,),
            ),
            Positioned(
              left: 0, right: 0, top: 101.h,
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/onboarding_leaf_left.svg'),
                  Spacer(),
                  SvgPicture.asset('assets/images/onboarding_leaf_right.svg')
                ],
              ),
            ),
            Positioned(
              left: 0, right: 0, top: context.mediaQueryPadding.top, bottom: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/onboarding1.png', width: Get.width * 0.7, height: 64.h, fit: BoxFit.contain,)
                        ],
                      ),
                    ),
                    Text(item.title, style: ThemeTextStyle.biryaniBold.apply(fontSizeDelta: 26.ssp),),
                    SizedBox(height: 10.h,),
                    Text(item.description, style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 16.ssp),),
                    SizedBox(height: 85.h,)
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
