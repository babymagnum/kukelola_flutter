import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';

class ListNotificationItem extends StatelessWidget {

  ListNotificationItem({@required this.item, @required this.onClick});

  final NotificationItem item;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Parent(
      gesture: Gestures()..onTap(onClick),
      style: ParentStyle()..background.color(item.unread ? Color(0xFFE9EAEA) : Colors.transparent)
        ..borderRadius(all: 8)..ripple(true)..padding(horizontal: 12.w, vertical: 16.h),
      child: Row(
        children: [
          Parent(
            style: ParentStyle()..background.color(Color(0xFF158AC9))..width(48.w)..height(48.w)..borderRadius(all: 1000),
            child: Center(
              child: Image.asset(item.image, width: 28.w, height: 28.w, fit: BoxFit.contain,),
            ),
          ),
          SizedBox(width: 14.w,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(item.time, style: ThemeTextStyle.biryaniBold.apply(fontSizeDelta: 8.ssp),),
                    ),
                    SizedBox(width: item.unread ? 10.w : 0),
                    item.unread ?
                    Text('NEW!', style: ThemeTextStyle.biryaniBold.apply(fontSizeDelta: 8.ssp),) :
                    Container(),
                  ],
                ),
                Text(item.title, style: ThemeTextStyle.biryaniBold.apply(fontSizeDelta: 14.ssp),),
                Text(item.description, style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 12.ssp),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
