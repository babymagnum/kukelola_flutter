import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';

class InputVerificationCode extends StatelessWidget {

  InputVerificationCode({Key key, @required this.onChange,
    @required this.focusNode, @required this.onEditingComplete, this.textInputAction,
    @required this.textEditingController}): super(key: key);

  final Function(String value) onChange;
  final FocusNode focusNode;
  final Function onEditingComplete;
  final TextInputAction textInputAction;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: ParentStyle()..borderRadius(all: 6)..background.color(Color(0xFFEAEAEA).withOpacity(0.7))
        ..padding(horizontal: 16.w)..height(66.w)..width(66.w),
      child: Center(
        child: TextField(
          onChanged: onChange,
          focusNode: focusNode,
          controller: textEditingController,
          onEditingComplete: onEditingComplete,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          textInputAction: textInputAction == null ? TextInputAction.next : textInputAction,
          style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 36.ssp, color: Color(0xFF4D4D4D)),
          decoration: InputDecoration(
            counterText: '',
            isDense: true,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
