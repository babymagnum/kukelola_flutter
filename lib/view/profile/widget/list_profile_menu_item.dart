import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/controller/common_controller.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/view/change_password/change_password_view.dart';

class ListProfileMenuItem extends StatelessWidget {

  ListProfileMenuItem({@required this.index, @required this.item, @required this.context});

  final ProfileMenuItem item;
  final int index;
  final BuildContext context;

  var _commonCt = Get.put(CommonController());

  _onClick() {
    if (index == 0) {
      _commonCt.setLanguage(context, _commonCt.language.value == Constant.INDONESIAN ? Constant.ENGLISH : Constant.INDONESIAN);
    } else if (index == 1) {

    } else if (index == 2) {

    } else if (index == 3) {

    } else if (index == 4) {
      Get.to(ChangePasswordView());
    } else {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      gesture: Gestures()..onTap(_onClick),
      style: ParentStyle()..ripple(true),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(child: SvgPicture.asset(item.image, width: 16.w, height: 16.w, color: item.logout ? Color(0xFFF85C58) : Color(0xFF018CCA),)),
              ],
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
