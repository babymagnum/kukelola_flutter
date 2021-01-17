import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';

class CustomInput extends StatelessWidget {

  CustomInput({Key key, this.controller, @required this.textInputAction,
    @required this.focusNode, @required this.hintText, @required this.inputType,
    this.isObsecure = null, @required this.onEditingComplete,
    this.onChanged, this.onObsecureClick, @required this.onTap,
    this.maxLines = 1, @required this.labelText}): super(key: key);

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
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: ThemeTextStyle.biryaniSemiBold.apply(color: focusNode.hasFocus ? ThemeColor.primary : Color(0xFFC4C4C4), fontSizeDelta: 10.ssp),),
        SizedBox(height: 4.h,),
        Stack(
          children: [
            TextField(
              onTap: onTap,
              onChanged: onChanged,
              autocorrect: false,
              enableSuggestions: false,
              controller: controller,
              focusNode: focusNode,
              onEditingComplete: onEditingComplete,
              keyboardType: inputType,
              maxLines: maxLines,
              textInputAction: textInputAction,
              style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 14.ssp),
              obscureText: isObsecure == null ? false : isObsecure,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                isDense: true,
                hintText: hintText,
                focusColor: ThemeColor.primary,
                hintStyle: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 14.ssp, color: Color(0xFFC4C4C4)),
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                enabledBorder: InputBorder.none,
              ),
            ),
            Positioned(
              right: 0, bottom: 0, top: 0,
              child: isObsecure != null ?
              GestureDetector(
                onTap: onObsecureClick,
                child: SvgPicture.asset(isObsecure ? 'assets/images/invisible.svg' : 'assets/images/visibility.svg', width: 18.w, height: 18.w, color: Color(0xFFC4C4C4)),
              ) :
              Container(),
            )
          ],
        ),
        SizedBox(height: 4.h,),
        Parent(style: ParentStyle()..width(Get.width)..height(1.h)..background.color(focusNode.hasFocus ? ThemeColor.primary : Color(0xFFC4C4C4)),)
      ],
    );
  }
}
