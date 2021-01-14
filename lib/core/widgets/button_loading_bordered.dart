import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';

class ButtonLoadingBordered extends StatelessWidget {

  ButtonLoadingBordered({Key key, @required this.borderColor, @required this.disable, this.fontSize, @required this.title,
    @required this.loading, @required this.onTap, this.textStyle, @required this.loadingSize,
    @required this.borderRadius, this.imageLeft, this.imageLeftSize, this.horizontalPadding = 10, this.verticalPadding = 5}): super(key: key);

  final String title;
  final bool loading;
  final Function onTap;
  final double fontSize;
  final bool disable;
  final Color borderColor;
  final TextStyle textStyle;
  final double loadingSize;
  final double borderRadius;
  final String imageLeft;
  final double imageLeftSize;
  final double verticalPadding;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Parent(
      gesture: Gestures()..onTap(disable ? null : onTap),
      style: ParentStyle()..border(all: 1, color: disable ? Color(0xFFAAB1B5) : borderColor)
        ..borderRadius(all: borderRadius)..ripple(true)..padding(horizontal: horizontalPadding.w, vertical: verticalPadding.h),
      child: Center(
        child: loading ?
        Stack(
          children: [
            Opacity(
              opacity: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  imageLeft == null ?
                  Container() :
                  SvgPicture.asset(imageLeft, width: imageLeftSize, height: imageLeftSize,),
                  SizedBox(width: imageLeft == null ? 0 : 4.w,),
                  Text(title, style: textStyle != null ? textStyle : ThemeTextStyle.robotoBold.apply(color: borderColor, fontSizeDelta: fontSize == null ? 16.ssp : fontSize),),
                ],
              ),
            ),
            Positioned(
              left: 0, right: 0, top: 0, bottom: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: loadingSize, width: loadingSize,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(borderColor),
                    ),
                  ),
                ],
              ),
            )
          ],
        ) :
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageLeft == null ?
            Container() :
            SvgPicture.asset(imageLeft, width: imageLeftSize, height: imageLeftSize,),
            SizedBox(width: imageLeft == null ? 0 : 4.w,),
            Text(title, style: textStyle != null ? textStyle : ThemeTextStyle.robotoBold.apply(color: borderColor, fontSizeDelta: fontSize == null ? 16.ssp : fontSize),),
          ],
        ),
      ),
    );
  }
}
