import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/controller/common_controller.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/measure_size.dart';

class CustomInput extends StatelessWidget {

  CustomInput({Key key, this.controller, @required this.textInputAction, @required this.focusNode,
    @required this.hintText, @required this.inputType, this.isObsecure = null, @required this.onEditingComplete,
    this.onChanged, this.onObsecureClick, this.showAdd = false, this.onAddClick,
    @required this.onTap, this.isDropdown = null, this.enable = true, this.hide = false}): super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final Function onEditingComplete;
  final TextInputType inputType;
  final TextInputAction textInputAction;
  final bool isObsecure;
  final String hintText;
  final Function(String value) onChanged;
  final Function onObsecureClick;
  final Function onAddClick;
  final Function onTap;
  final bool isDropdown;
  final bool enable;
  final bool showAdd;
  final bool hide;

  var _commonController = Get.put(CommonController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MeasureSize(
          onChange: (Size size) {
            if (size.height > 20) _commonController.setInputHeight(size.height);
          },
          child: TextField(
            onTap: enable ? onTap : null,
            onChanged: onChanged,
            autocorrect: false,
            enableSuggestions: false,
            controller: controller,
            focusNode: focusNode,
            onEditingComplete: onEditingComplete,
            keyboardType: inputType,
            maxLines: 1,
            enabled: enable,
            textInputAction: textInputAction,
            style: ThemeTextStyle.robotoRegular.apply(fontSizeDelta: 16.ssp),
            obscureText: isObsecure == null ? false : isObsecure,
            decoration: InputDecoration(
              isDense: true,
              hintText: hintText,
              labelText: hintText,
              labelStyle: ThemeTextStyle.robotoRegular.apply(fontSizeDelta: 16.ssp, color: focusNode.hasFocus ? ThemeColor.primary : enable ? ThemeColor.black : Color(0xFF999999)),
              filled: true,
              fillColor: Color(0xFFE8E8E8),
              focusColor: ThemeColor.primary,
              hintStyle: ThemeTextStyle.robotoRegular.apply(fontSizeDelta: 16.ssp, color: enable ? ThemeColor.black : Color(0xFF999999)),
              focusedBorder: hide ? InputBorder.none : UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 3,
                  color: focusNode.hasFocus ? ThemeColor.primary : enable ? Color(0xFF4D4D4D) : Color(0xFF999999),
                ),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              ),
              disabledBorder: hide ? InputBorder.none : UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 3,
                  color: focusNode.hasFocus ? ThemeColor.primary : enable ? Color(0xFF4D4D4D) : Color(0xFF999999),
                ),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              enabledBorder: hide ? InputBorder.none : UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 3,
                  color: focusNode.hasFocus ? ThemeColor.primary : enable ? Color(0xFF4D4D4D) : Color(0xFF999999),
                ),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              ),
            ),
          ),
        ),
        Positioned(
          right: 16.w + (showAdd ? (24.w + 16.w * 2) : 0), top: 0, bottom: 0,
          child: isObsecure != null ?
          GestureDetector(
            onTap: onObsecureClick,
            child: SvgPicture.asset(isObsecure ? 'assets/images/invisible.svg' : 'assets/images/visibility.svg', width: 24.w, height: 24.w, color: Color(0xFF8E8E93)),
          ) :
          isDropdown != null ?
          Padding(
            padding: EdgeInsets.only(top: controller != null && controller.text.trim() != '' ? 13.h : 0),
            child: GestureDetector(
              onTap: enable ? onTap : null,
              child: Icon(Icons.arrow_drop_down, size: 24.w,),
            ),
          ) :
          Container(),
        ),
        Positioned(
          top: 0, bottom: 0, right: 0,
          child: showAdd ?
          Obx(() => Parent(
            gesture: Gestures()..onTap(onAddClick),
            style: ParentStyle()..height(_commonController.inputHeight.value - 1.h)..borderRadius(topRight: 8)
              ..background.color(ThemeColor.secondary)..padding(horizontal: 16.w)..ripple(true),
            child: Center(
              child: SvgPicture.asset('assets/images/plus.svg', width: 24.w, height: 24.w,),
            ),
          ),
          ) :
          Container(),
        )
      ],
    );
  }
}
