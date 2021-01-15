import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:kukelola_flutter/view/login/login_view.dart';
import 'package:kukelola_flutter/view/onboarding/onboarding_controller.dart';
import 'package:kukelola_flutter/view/onboarding/widget/onboarding1.dart';
import 'package:kukelola_flutter/view/onboarding/widget/onboarding2.dart';
import 'package:kukelola_flutter/view/onboarding/widget/onboarding3.dart';
import 'package:kukelola_flutter/view/onboarding/widget/page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingView extends StatefulWidget {
  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {

  var _onboardingCt = Get.put(OnboardingController());
  var _pageCt = PageController(initialPage: 0);

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
  void dispose() {
    _pageCt.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageCt,
              onPageChanged: (index) => _onboardingCt.setOnboardingSelectedPage(index),
              children: [
                Onboarding1(item: _onboardingCt.listOnboarding[0],),
                Onboarding2(item: _onboardingCt.listOnboarding[1],),
                Onboarding3(item: _onboardingCt.listOnboarding[2],)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Obx(() => Row(
              children: [
                Opacity(
                  opacity: _onboardingCt.onboardingSelectedPage.value == 2 ? 0 : 1,
                  child: GestureDetector(
                    child: Text('Next', style: ThemeTextStyle.biryaniBold.apply(color: ThemeColor.secondary, fontSizeDelta: 16.ssp),),
                    onTap: () {
                      if (_onboardingCt.onboardingSelectedPage.value == 2) return;

                      _pageCt.animateToPage(_onboardingCt.onboardingSelectedPage.value + 1, duration: Duration(milliseconds: 400), curve: Curves.easeIn);
                    },
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: pageIndicators(),
                  ),
                ),
                Opacity(
                  opacity: _onboardingCt.onboardingSelectedPage.value == 2 ? 0 : 1,
                  child: GestureDetector(
                    onTap: () async {
                      if (_onboardingCt.onboardingSelectedPage.value == 2) return;

                      final preference = await SharedPreferences.getInstance();
                      await preference.setBool(Constant.IS_ONBOARDING, true);

                      Get.off(LoginView());
                    },
                    child: Text('Skip', style: ThemeTextStyle.biryaniBold.apply(color: ThemeColor.secondary, fontSizeDelta: 16.ssp),),
                  ),
                ),
              ],
            )),
          ),
          SizedBox(height: 28.h,)
        ],
      ),
    );
  }
}
