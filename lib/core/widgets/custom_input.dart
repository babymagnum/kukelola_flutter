import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';

class CustomInput extends StatelessWidget {

  CustomInput({Key key, this.controller, @required this.labelText, @required this.textInputAction,
    @required this.focusNode, @required this.hintText, @required this.inputType,
    this.isObsecure = null, @required this.onEditingComplete,
    this.onChanged, this.onObsecureClick, @required this.onTap, this.enable = true,
    this.filled = false, this.maxLines = 1}): super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final Function onEditingComplete;
  final TextInputType inputType;
  final TextInputAction textInputAction;
  final bool isObsecure;
  final String hintText;
  final String labelText;
  final Function(String value) onChanged;
  final Function onObsecureClick;
  final Function onTap;
  final bool enable;
  final bool filled;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          onTap: enable ? onTap : null,
          onChanged: onChanged,
          autocorrect: false,
          enableSuggestions: false,
          controller: controller,
          focusNode: focusNode,
          onEditingComplete: onEditingComplete,
          keyboardType: inputType,
          maxLines: maxLines,
          enabled: enable,
          textInputAction: textInputAction,
          style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 16.ssp),
          obscureText: isObsecure == null ? false : isObsecure,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            isDense: true,
            hintText: labelText,
            labelText: hintText,
            labelStyle: ThemeTextStyle.biryaniBold.apply(fontSizeDelta: 12.ssp, color: focusNode.hasFocus ? ThemeColor.primary : Color(0xFFC4C4C4)),
            filled: filled,
            fillColor: Color(0xFFE8E8E8),
            focusColor: ThemeColor.primary,
            hintStyle: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 16.ssp, color: Color(0xFFC4C4C4)),
            focusedBorder: !filled ? UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: focusNode.hasFocus ? ThemeColor.primary : Color(0xFFC4C4C4))
            ) : UnderlineInputBorder(
              borderSide: BorderSide(
                width: 3,
                color: focusNode.hasFocus ? ThemeColor.primary : enable ? Color(0xFF4D4D4D) : Color(0xFF999999),
              ),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            ),
            disabledBorder: !filled ? UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: focusNode.hasFocus ? ThemeColor.primary : Color(0xFFC4C4C4))
            ) : UnderlineInputBorder(
              borderSide: BorderSide(
                width: 3,
                color: focusNode.hasFocus ? ThemeColor.primary : enable ? Color(0xFF4D4D4D) : Color(0xFF999999),
              ),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            ),
            contentPadding: !filled ? EdgeInsets.only(top: 25.h, bottom: 0) : EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            enabledBorder: !filled ? UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: focusNode.hasFocus ? ThemeColor.primary : Color(0xFFC4C4C4))
            ) : UnderlineInputBorder(
              borderSide: BorderSide(
                width: 3,
                color: focusNode.hasFocus ? ThemeColor.primary : enable ? Color(0xFF4D4D4D) : Color(0xFF999999),
              ),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            ),
          ),
        ),
        Positioned(
          right: 0, bottom: 10.h,
          child: isObsecure != null ?
          GestureDetector(
            onTap: onObsecureClick,
            child: SvgPicture.asset(isObsecure ? 'assets/images/invisible.svg' : 'assets/images/visibility.svg', width: 18.w, height: 18.w, color: Color(0xFFC4C4C4)),
          ) :
          Container(),
        )
      ],
    );
  }
}
