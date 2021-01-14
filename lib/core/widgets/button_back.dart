import 'dart:io';

import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';

class ButtonBack extends StatelessWidget {

  ButtonBack({@required this.label, this.login = false});

  final String label;
  final bool login;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Parent(
          gesture: Gestures()..onTap(() => login ? exit(0) : Get.back()),
          style: ParentStyle()..borderRadius(all: 4)..background.color(ThemeColor.secondary)..width(32.w)..height(32.w),
          child: Center(
            child: SvgPicture.asset('assets/images/arrow_left.svg'),
          ),
        ),
        SizedBox(width: 16.w,),
        Text(label, style: ThemeTextStyle.biryaniBold.apply(fontSizeDelta: 16.ssp),)
      ],
    );
  }
}
