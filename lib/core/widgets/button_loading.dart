import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';

class ButtonLoading extends StatelessWidget {

  ButtonLoading({Key key, @required this.backgroundColor, @required this.disable,
    @required this.title, @required this.loading, @required this.onTap, @required this.textStyle,
    this.verticalPadding = 5, this.horizontalPadding = 10, this.loadingSize = 17}): super(key: key);

  final String title;
  final bool loading;
  final Function onTap;
  final bool disable;
  final Color backgroundColor;
  final double verticalPadding;
  final double horizontalPadding;
  final double loadingSize;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Parent(
      gesture: Gestures()..onTap(disable ? null : onTap),
      style: ParentStyle()..background.color(disable ? Color(0xFFC4C4C4) : backgroundColor)..borderRadius(all: 6)..ripple(true)
        ..padding(horizontal: horizontalPadding.w, vertical: verticalPadding.h),
      child: Center(
        child: loading ?
        Stack(
          children: [
            Opacity(
              opacity: 0,
              child: Padding(
                padding: EdgeInsets.only(top: 3.h),
                child: Text(title, style: textStyle,),
              ),
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
        Padding(
          padding: EdgeInsets.only(top: 3.h),
          child: Text(title, style: textStyle,),
        ),
      ),
    );
  }
}
