import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/button_reload.dart';
import 'package:kukelola_flutter/core/widgets/empty_text.dart';
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:kukelola_flutter/view/calendar/calendar_controller.dart';
import 'package:kukelola_flutter/view/calendar/widget/list_calendar_item.dart';

class CalendarView extends StatelessWidget {

  var _calendarCt = Get.put(CalendarController(), permanent: true);

  @override
  Widget build(BuildContext context) {

    if (_calendarCt.listCalendar.length == 0) _calendarCt.populateData();

    return BaseView(
      body: Column(
        children: [
          SizedBox(height: context.mediaQueryPadding.top + 24.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              children: [
                Expanded(
                  child: ButtonBack(
                    label: 'Calendar',
                    onBack: () => Get.back(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() =>
              _calendarCt.loadingCalendar.value?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(ThemeColor.primary),),
                    width: 16.w, height: 16.w,
                  )
                ],
              ) :
              _calendarCt.errorCalendar.value ?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonReload(onTap: _calendarCt.populateData())
                ],
              ) :
              _calendarCt.listCalendar.length == 0 ?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EmptyText(text: 'Empty event')
                ],
              ) :
              ListView.separated(
                itemCount: _calendarCt.listCalendar.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                itemBuilder: (_, index) => ListCalendarItem(item: _calendarCt.listCalendar[index]),
                separatorBuilder: (BuildContext context, int index) => Divider(height: 16.h, color: Colors.transparent,),
              )
            ),
          )
        ],
      ),
    );
  }
}
