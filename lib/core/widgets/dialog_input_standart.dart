import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';

class DialogInputStandart extends StatefulWidget {

  DialogInputStandart({@required this.onTap, @required this.title, @required this.hint, this.value = ''});

  final String title;
  final String hint;
  final Function(String value) onTap;
  final String value;

  @override
  _DialogInputStandartState createState() => _DialogInputStandartState();
}

class _DialogInputStandartState extends State<DialogInputStandart> {

  var _inputController = TextEditingController();
  var _inputFocus = FocusNode();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      setState(() => _inputController.text = widget.value);
    });
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  Widget _input(controller, hint, FocusNode focus, type, inputAction, onEditingComplete) {
    return Material(
      child: TextField(
        autocorrect: false,
        enableSuggestions: false,
        controller: controller,
        onEditingComplete: () {
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() => focus.unfocus());
        },
        onChanged: (_) => setState(() {}),
        keyboardType: type,
        maxLines: 1,
        focusNode: focus,
        textInputAction: inputAction,
        onTap: () => setState(() => focus.requestFocus()),
        style: ThemeTextStyle.robotoRegular.apply(fontSizeDelta: 16.ssp),
        decoration: InputDecoration(
          isDense: true,
          hintText: hint,
          labelText: hint,
          labelStyle: ThemeTextStyle.robotoRegular.apply(fontSizeDelta: 16.ssp, color: focus.hasFocus ? ThemeColor.primary : Colors.black),
          filled: true,
          fillColor: Color(0xFFE8E8E8),
          focusColor: ThemeColor.primary,
          hintStyle: ThemeTextStyle.robotoRegular.apply(fontSizeDelta: 16.ssp),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 3,
              color: focus.hasFocus ? ThemeColor.primary : Color(0xFF4D4D4D),
            ),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 3,
              color: focus.hasFocus ? ThemeColor.primary : Color(0xFF4D4D4D),
            ),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
          ),
        ),
      ),
    );
  }

  bool _isDisable() {
    if (_inputController.text.trim() == '') return true;
    else return false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      elevation: 0,
      content: Parent(
        style: ParentStyle()..borderRadius(all: 8)..background.color(Colors.white)
          ..padding(vertical: 20.w, horizontal: 20.w)..maxHeight(Get.height - (Get.height * (0.05 * 2)))
          ..width(Get.width - ((Get.width * 0.2) * 2)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(widget.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.robotoBold.apply(fontSizeDelta: 18.ssp, decoration: TextDecoration.none),),
                  ),
                  SizedBox(width: 10.w,),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: SvgPicture.asset('assets/images/ic_close.svg', width: 24.w, height: 24.w,),
                  )
                ],
              ),
              SizedBox(height: 30.h,),
              _input(_inputController, widget.hint, _inputFocus, TextInputType.text, TextInputAction.done, () => FocusScope.of(context).requestFocus(FocusNode())),
              SizedBox(height: 30.h,),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    if (!_isDisable()) {
                      widget.onTap(_inputController.text.trim());
                      Get.back();
                    }
                  },
                  child: Text('Simpan', style: ThemeTextStyle.robotoBold.apply(color: _isDisable() ? Color(0xFF999999) : ThemeColor.secondary, fontSizeDelta: 21.ssp, decoration: TextDecoration.none),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
