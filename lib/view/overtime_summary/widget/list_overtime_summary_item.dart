import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/networking/model/overtime_summary_grid.dart';
import 'package:kukelola_flutter/view/overtime_summary/overtime_summary_detail_view.dart';

class ListOvertimeSummaryItem extends StatelessWidget {

  ListOvertimeSummaryItem({@required this.item});

  final OvertimeSummaryGridData item;
  
  @override
  Widget build(BuildContext context) {
    return Parent(
      gesture: Gestures()..onTap(() => Get.to(OvertimeSummaryDetailView(item: item))),
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
                    Text('Overtime', style: ThemeTextStyle.biryaniBold.apply(color: Color(0xFF158AC9), fontSizeDelta: 14.ssp),),
                    Text('${item.overtimeDate} ${item.startHour} - ${item.endHour}', style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 10.ssp),),
                  ],
                ),
              ),
              SizedBox(width: 10.w,),
              Text('APPROVED', style: ThemeTextStyle.biryaniExtraBold.apply(color: Color(0xFF1AB394), fontSizeDelta: 12.ssp),)
            ],
          ),
          SizedBox(height: 24.h,),
          Text('${item.employeeName} / ${item.jobTitle}', style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 10.ssp),),
          Text(item.nip, style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 10.ssp),),
        ],
      ),
    );
  }
}
