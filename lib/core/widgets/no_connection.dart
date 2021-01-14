import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';

class NoConnection extends StatelessWidget {

  NoConnection({@required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: height,
      width: size.width,
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 24.w),
      decoration: BoxDecoration(
        color: Colors.black
      ),
      child: Center(child: Text('No connection', textAlign: TextAlign.center, style: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 12.ssp),)),
    );
  }
}
