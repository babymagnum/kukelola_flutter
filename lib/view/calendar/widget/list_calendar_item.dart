import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/networking/model/corporate_calendar.dart';

class ListCalendarItem extends StatelessWidget {

  ListCalendarItem({@required this.item});

  final CorporateCalendarData item;

  Color _statusColor() {
    if (item.isHoliday) return ThemeColor.primary;
    else return Color(0xFF6D6D6D);
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: ParentStyle()..background.color(Color(0xFFE9EAEA))..borderRadius(all: 8)..padding(horizontal: 16, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name ?? '', style: ThemeTextStyle.biryaniBold.apply(color: Color(0xFF158AC9), fontSizeDelta: 14.ssp),),
                    Text(item.eventDate ?? '', style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 10.ssp),),
                  ],
                ),
              ),
              SizedBox(width: 10.w,),
              Parent(
                style: ParentStyle()..background.color(_statusColor())..borderRadius(all: 1000),
                child: Padding(
                  padding: EdgeInsets.only(left: 7.w, right: 7.w, top: (3.5).h, bottom: 2),
                  child: Text((item.isHoliday ?? false) ? 'HOLIDAY' : 'WORK DAY', style: ThemeTextStyle.biryaniExtraBold.apply(color: Colors.white, fontSizeDelta: 7.ssp),),
                ),
              )
            ],
          ),
          SizedBox(height: 24.h,),
          Text(item.description, style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 10.ssp),),
        ],
      ),
    );
  }
}
