import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';

class ButtonLoading extends StatelessWidget {

  ButtonLoading({Key key, @required this.backgroundColor, @required this.disable,
    this.fontSize, @required this.title, @required this.loading, @required this.onTap,
    this.verticalPadding = 5, this.horizontalPadding = 10, this.loadingSize = 17}): super(key: key);

  final String title;
  final bool loading;
  final Function onTap;
  final double fontSize;
  final bool disable;
  final Color backgroundColor;
  final double verticalPadding;
  final double horizontalPadding;
  final double loadingSize;

  @override
  Widget build(BuildContext context) {
    return Parent(
      gesture: Gestures()..onTap(disable ? null : onTap),
      style: ParentStyle()..background.color(disable ? ThemeColor.grey : backgroundColor)..borderRadius(all: 6)..ripple(true)
        ..padding(horizontal: horizontalPadding.w, vertical: verticalPadding.h),
      child: Center(
        child: loading ?
        Stack(
          children: [
            Opacity(
              opacity: 0,
              child: Text(title, style: ThemeTextStyle.robotoRegular.apply(color: Colors.white, fontSizeDelta: fontSize == null ? 14.ssp : fontSize),),
            ),
            Positioned(
              left: 0, right: 0, top: 0, bottom: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: loadingSize.w, width: loadingSize.w,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ) :
        Text(title, style: ThemeTextStyle.robotoBold.apply(color: Colors.white, fontSizeDelta: fontSize == null ? 16.ssp : fontSize),),
      ),
    );
  }
}
