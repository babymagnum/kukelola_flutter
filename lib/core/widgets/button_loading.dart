import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';

class ButtonLoading extends StatelessWidget {

  ButtonLoading({Key key, @required this.backgroundColor, @required this.disable,
    @required this.title, @required this.loading, @required this.onTap, @required this.textStyle,
    this.verticalPadding = 13, this.horizontalPadding = 10, this.loadingSize = 17,
    this.borderRadius = 6, this.image = '', this.imageSize, this.imageMargin}): super(key: key);

  final String title;
  final bool loading;
  final Function onTap;
  final bool disable;
  final Color backgroundColor;
  final double verticalPadding;
  final double horizontalPadding;
  final double loadingSize;
  final TextStyle textStyle;
  final double borderRadius;
  final String image;
  final Size imageSize;
  final double imageMargin;

  @override
  Widget build(BuildContext context) {
    return Parent(
      gesture: Gestures()..onTap(disable ? null : onTap),
      style: ParentStyle()..background.color(disable ? Color(0xFFC4C4C4) : backgroundColor)..borderRadius(all: borderRadius)..ripple(true)
        ..padding(horizontal: horizontalPadding.w, vertical: verticalPadding.h),
      child: Center(
        child: loading ?
        Stack(
          children: [
            Opacity(
              opacity: 0,
              child: Padding(
                padding: EdgeInsets.only(top: 3.h),
                child: Text(title, style: textStyle, maxLines: 1,),
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
          child: image != '' ?
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 3.h),
                child: SvgPicture.asset(image, width: imageSize.width ?? 0, height: imageSize.height ?? 0, color: Colors.white,),
              ),
              SizedBox(width: imageMargin ?? 0,),
              Text(title, style: textStyle, maxLines: 1,),
            ],
          ) :
          Text(title, style: textStyle,),
        ),
      ),
    );
  }
}
