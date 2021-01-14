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
          SvgPicture.asset('assets/images/Refresh.svg', width: 13.w, height: 13.w, color: ThemeColor.secondary,),
          SizedBox(width: 6.w,),
          Text('Muat Ulang?', style: ThemeTextStyle.robotoRegular.apply(fontSizeDelta: 12.ssp, color: ThemeColor.secondary),)
        ],
      ),
    );
  }
}
