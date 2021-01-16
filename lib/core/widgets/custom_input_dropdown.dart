import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';

class CustomInputDropdown extends StatelessWidget {

  CustomInputDropdown({Key key, @required this.labelText,
    @required this.hintText, @required this.onTap, @required this.controller,
    @required this.rightIcon}): super(key: key);

  final String hintText;
  final String labelText;
  final Function onTap;
  final TextEditingController controller;
  final String rightIcon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          onTap: onTap,
          controller: controller,
          maxLines: 1,
          enabled: true,
          style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 16.ssp),
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            isDense: true,
            hintText: labelText,
            labelText: hintText,
            labelStyle: ThemeTextStyle.biryaniBold.apply(fontSizeDelta: 12.ssp, color: Color(0xFFC4C4C4)),
            fillColor: Color(0xFFE8E8E8),
            focusColor: ThemeColor.primary,
            hintStyle: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 16.ssp, color: Color(0xFFC4C4C4)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xFFC4C4C4))
            ),
            disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xFFC4C4C4))
            ),
            contentPadding: EdgeInsets.only(top: 25.h, bottom: 0),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xFFC4C4C4))
            ),
          ),
        ),
        Positioned(
          right: 0, bottom: 10.h,
          child: rightIcon == '' ?
          Container() :
          GestureDetector(
            onTap: onTap,
            child: SvgPicture.asset(rightIcon, width: 10.w, height: 16.h, color: Color(0xFFC4C4C4)),
          ),
        )
      ],
    );
  }
}
