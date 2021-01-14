import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:kukelola_flutter/view/onboarding_view/onboarding_controller.dart';
import 'package:kukelola_flutter/view/onboarding_view/widget/page_indicator.dart';

class OnboardingView extends StatefulWidget {
  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {

  var _onboardingCt = Get.put(OnboardingController());

  List<Widget> pageIndicators() {
    List<Widget> listWidget = List();

    for(int i=0; i<_onboardingCt.listOnboarding.length; i++) {
      listWidget.add(
        Obx(() => PageIndicator(
          isSelected: _onboardingCt.onboardingSelectedPage.value == i,
          isFirst: i == 0,
          isLast: i == _onboardingCt.listOnboarding.length -1,
        ))
      );
    }

    return listWidget;
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: Get.width, height: Get.height,
                ),
                Stack(
                  children: [
                    Positioned(
                      left: 0, right: 0, top: 44.h,
                      child: SvgPicture.asset('assets/images/onboarding_clock.svg', width: 106.w, height: 106.w,),
                    ),
                    Positioned(
                      left: 0, right: 0, top: 81.h,
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/images/onboarding_leaf_left.svg'),
                          Spacer(),
                          SvgPicture.asset('assets/images/onboarding_leaf_right.svg')
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Row(
            children: [
              Text('Next'),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pageIndicators(),
                ),
              ),
              Text('Skip')
            ],
          )
        ],
      ),
    );
  }
}
