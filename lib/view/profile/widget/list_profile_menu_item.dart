import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/view/change_password/change_password_view.dart';
import 'package:kukelola_flutter/view/container_home/container_home_controller.dart';
import 'package:kukelola_flutter/view/education_data/education_data_view.dart';
import 'package:kukelola_flutter/view/families/families_view.dart';
import 'package:kukelola_flutter/view/login/login_view.dart';
import 'package:kukelola_flutter/view/personal_data/personal_data_view.dart';
import 'package:kukelola_flutter/view/working_experience/working_experience_view.dart';

class ListProfileMenuItem extends StatelessWidget {

  final ProfileMenuItem item;
  final int index;
  final BuildContext context;

  ListProfileMenuItem({@required this.index, @required this.item, @required this.context});

  var _containerHomeCt = Get.find<ContainerHomeController>();

  _onClick() {
    if (index == 0) {
      // commonController.setLanguage(context, commonController.language.value == Constant.INDONESIAN ? Constant.ENGLISH : Constant.INDONESIAN);
      Get.to(PersonalDataView());
    } else if (index == 1) {
      Get.to(EducationDataView());
    } else if (index == 2) {
      Get.to(FamiliesView());
    } else if (index == 3) {
      Get.to(WorkingExperienceView());
    } else if (index == 4) {
      Get.to(ChangePasswordView());
    } else {
      _containerHomeCt.setSelectedPage(0);
      commonController.preferences.setBool(Constant.IS_LOGIN, false);
      Get.offAll(LoginView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      gesture: Gestures()..onTap(_onClick),
      style: ParentStyle()..ripple(true),
      child: Row(
        children: [
          Parent(
            style: ParentStyle()..background.color(item.logout ? Colors.transparent : Color(0xFF158AC9))..borderRadius(all: 1000)..width(28.w)..height(28.w),
            child: Center(
              child: Image.asset(item.image, width: 18.w, height: 18.w, color: item.logout ? Color(0xFFF85C58) : null,),
            ),
          ),
          SizedBox(width: 20.w,),
          Expanded(
            flex: 14,
            child: Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Text(item.label, style: ThemeTextStyle.biryaniBold.apply(fontSizeDelta: 12.ssp, color: item.logout ? Color(0xFFF85C58) : Color(0xFF181921)),),
            ),
          ),
          SizedBox(width: 10.w,),
          SvgPicture.asset('assets/images/fa-solid_chevron-right.svg', width: 9.w, height: 14.h, color: item.logout ? Color(0xFFF85C58) : Color(0xFF181921),)
        ],
      ),
    );
  }
}
