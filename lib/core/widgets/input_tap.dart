import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';

class InputTap extends StatelessWidget {

  InputTap({Key key, @required this.labelText, @required this.hintText, @required this.onTap,
    @required this.rightIcon, @required this.value, @required this.leftIcon,
    this.leftSize, this.rightSize}): super(key: key);

  final String hintText;
  final String labelText;
  final String value;
  final Function onTap;
  final String rightIcon;
  final String leftIcon;
  final Size leftSize;
  final Size rightSize;

  @override
  Widget build(BuildContext context) {
    return Parent(
      gesture: Gestures()..onTap(onTap),
      style: ParentStyle()..ripple(true),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText, style: ThemeTextStyle.biryaniBold.apply(color: Color(0xFFC4C4C4), fontSizeDelta: 10.ssp),),
          SizedBox(height: 0.h,),
          Row(
            children: [
              leftIcon == '' ?
              Container() :
              Padding(
                padding: EdgeInsets.only(bottom: 5.h),
                child: SvgPicture.asset(leftIcon, width: leftSize?.width ?? 0, height: leftSize?.height ?? 0, color: Color(0xFFC4C4C4),),
              ),
              SizedBox(width: 10.w,),
              Expanded(
                child: Text(value, style: value == '' ? ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 16.ssp, color: Color(0xFFC4C4C4)) : ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 16.ssp),),
              ),
              SizedBox(width: 10.w,),
              rightIcon == '' ?
              Container() :
              Padding(
                padding: EdgeInsets.only(bottom: 5.h),
                child: SvgPicture.asset(rightIcon, width: rightSize?.width ?? 0, height: rightSize?.height ?? 0, color: Color(0xFFC4C4C4),),
              ),
            ],
          ),
          SizedBox(height: 0.h,),
          Parent(style: ParentStyle()..width(Get.width)..height(1.h)..background.color(Color(0xFFC4C4C4)),)
        ],
      ),
    );
  }
}
