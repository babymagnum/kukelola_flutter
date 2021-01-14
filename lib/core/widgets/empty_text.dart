import 'package:flutter/material.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';

class EmptyText extends StatelessWidget {

  EmptyText({@required this.text, @required this.textSize});

  final String text;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: ThemeTextStyle.robotoRegular.apply(color: Color(0xFF6E737B).withOpacity(0.47), fontSizeDelta: textSize));
  }
}
