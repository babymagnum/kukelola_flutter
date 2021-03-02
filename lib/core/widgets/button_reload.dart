import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';

class ButtonReload extends StatelessWidget {

  ButtonReload({@required this.onTap});

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(Icons.refresh, color: ThemeColor.secondary, size: 20.w,),
          SizedBox(width: 6.w,),
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Text('Muat Ulang?', style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 12.ssp, color: ThemeColor.secondary),),
          )
        ],
      ),
    );
  }
}
