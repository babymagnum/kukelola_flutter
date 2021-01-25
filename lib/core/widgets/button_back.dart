import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';

class ButtonBack extends StatelessWidget {

  ButtonBack({this.whiteColor = false, @required this.label, @required this.onBack});

  final String label;
  final Function onBack;
  final bool whiteColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Parent(
          gesture: Gestures()..onTap(onBack),
          style: ParentStyle()..borderRadius(all: 4)..background.color(ThemeColor.secondary)..width(32.w)..height(32.w),
          child: Center(
            child: SvgPicture.asset('assets/images/arrow_left.svg'),
          ),
        ),
        SizedBox(width: 16.w,),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 3.h),
            child: Text(label, style: ThemeTextStyle.biryaniBold.apply(fontSizeDelta: 16.ssp, color: whiteColor ? Colors.white : Color(0xFF181921)), overflow: TextOverflow.ellipsis, maxLines: 1,),
          ),
        )
      ],
    );
  }
}
