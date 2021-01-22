import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';

class SummaryDetailStatus extends StatelessWidget {

  SummaryDetailStatus({@required this.color, @required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: ParentStyle()..background.color(color)..padding(horizontal: 8.w, vertical: 4.h)..borderRadius(all: 1000),
      child: Text(label, style: ThemeTextStyle.biryaniSemiBold.apply(color: Colors.white, fontSizeDelta: 5.ssp),),
    );
  }
}
