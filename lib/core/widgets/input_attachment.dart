import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';

class InputAttachment extends StatelessWidget {

  InputAttachment({Key key, @required this.labelText, @required this.hintText,
    @required this.onTap, @required this.loading, @required this.value}): super(key: key);

  final String hintText;
  final String labelText;
  final String value;
  final Function onTap;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: ParentStyle()..ripple(true),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText, style: ThemeTextStyle.biryaniSemiBold.apply(color: Color(0xFFC4C4C4), fontSizeDelta: 10.ssp),),
          SizedBox(height: 4.h,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(value == '' ? hintText : value, style: value == '' ? ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 14.ssp, color: Color(0xFFC4C4C4)) : ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 14.ssp),),
                    SizedBox(height: 0.h,),
                    Parent(style: ParentStyle()..width(Get.width)..height(1.h)..background.color(Color(0xFFC4C4C4)),),
                  ],
                ),
              ),
              SizedBox(width: 10.w,),
              ButtonLoading(
                backgroundColor: ThemeColor.primary,
                disable: loading,
                title: 'Choose File...',
                loading: loading,
                onTap: onTap,
                verticalPadding: 6.h,
                horizontalPadding: 10.w,
                loadingSize: 10.w,
                textStyle: ThemeTextStyle.biryaniSemiBold.apply(fontSizeDelta: 10.ssp, color: Colors.white),
              )
            ],
          ),
          SizedBox(height: 4.h,),
          Text('*Maximum file size is 1 MB', style: ThemeTextStyle.biryaniSemiBold.apply(color: Color(0xFFC4C4C4), fontSizeDelta: 8.ssp),),
        ],
      ),
    );
  }
}
