import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/view/leave_summary/leave_summary_view.dart';

class ListSummaryMenuItem extends StatelessWidget {

  ListSummaryMenuItem({@required this.index, @required this.item});

  final SummaryMenuItems item;
  final int index;

  getTo() {
    if (index == 0) {

    } else if (index == 1) {
      Get.to(LeaveSummaryView());
    } else if (index == 2) {

    } else {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      gesture: Gestures()..onTap(getTo),
      style: ParentStyle()..background.color(Colors.white)
        ..boxShadow(color: Colors.black.withOpacity(0.05), offset: Offset(0, 6), blur: 30, spread: 0)
        ..borderRadius(all: 12)..padding(horizontal: 30.w),
      child: Column(
        children: [
          SizedBox(height: 24.h,),
          Parent(
            style: ParentStyle()..background.color(Color(0xFF158AC9))..borderRadius(all: 1000)
              ..height(88.w)..width(88.w),
            child: Center(
              child: Image.asset(item.image, width: 48.w, height: 48.w, fit: BoxFit.contain,),
            ),
          ),
          SizedBox(height: 12.h,),
          Text(item.label + '\n', textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.biryaniSemiBold.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 12.ssp),),
          SizedBox(height: 24.h,),
        ],
      ),
    );
  }
}
