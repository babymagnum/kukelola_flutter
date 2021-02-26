import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/measure_size.dart';
import 'package:kukelola_flutter/main.dart';

class InputTap extends StatelessWidget {

  InputTap({Key key, @required this.labelText, @required this.hintText, @required this.onTap,
    this.rightIcon = '', @required this.value, this.leftIcon = '',
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
    return MeasureSize(
      onChange: (Size size) => commonController.setInputTapHeight(size.height),
      child: Parent(
        gesture: Gestures()..onTap(onTap),
        style: ParentStyle()..ripple(true),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(labelText, style: ThemeTextStyle.biryaniSemiBold.apply(color: Color(0xFFC4C4C4), fontSizeDelta: 10.ssp),),
            SizedBox(height: 4.h,),
            Row(
              children: [
                leftIcon == '' ?
                Container() :
                Padding(
                  padding: EdgeInsets.only(bottom: 5.h),
                  child: SvgPicture.asset(leftIcon, width: leftSize?.width ?? 0, height: leftSize?.height ?? 0, color: Color(0xFFC4C4C4),),
                ),
                SizedBox(width: leftIcon == '' ? 0 : 10.w,),
                Expanded(
                  child: Text(value == '' ? hintText : value, maxLines: 1, overflow: TextOverflow.ellipsis, style: value == '' ? ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 14.ssp, color: Color(0xFFC4C4C4)) : ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 14.ssp),),
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
            SizedBox(height: 4.h,),
            Parent(style: ParentStyle()..width(Get.width)..height(1.h)..background.color(Color(0xFFC4C4C4)),)
          ],
        ),
      ),
    );
  }
}
