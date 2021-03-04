import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';

class ListStandartDropdownItem extends StatelessWidget {

  ListStandartDropdownItem({Key key, @required this.content, @required this.onClick}): super(key: key);

  final String content;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Parent(
      gesture: Gestures()..onTap(onClick),
      style: ParentStyle()..ripple(true),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Expanded(
                child: Text(content, maxLines: 1, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 14.ssp),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
