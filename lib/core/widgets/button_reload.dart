import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';

class ButtonReload extends StatelessWidget {

  ButtonReload({@required this.onTap, this.error});

  final Function onTap;
  final String error;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          error == null ?
          Container() :
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Text(error, textAlign: TextAlign.center, style: ThemeTextStyle.biryaniRegular.apply(color: ThemeColor.disabled, fontSizeDelta: 12.ssp),),
          ),
          GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.refresh, color: ThemeColor.secondary, size: 20.w,),
                SizedBox(width: 6.w,),
                Padding(
                  padding: EdgeInsets.only(top: 2.h),
                  child: Text('Muat Ulang?', style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 12.ssp, color: ThemeColor.secondary),),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
