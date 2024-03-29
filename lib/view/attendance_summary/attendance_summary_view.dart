import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/custom_date_picker.dart';
import 'package:kukelola_flutter/core/widgets/empty_text.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/view/attendance_summary/attendance_summary_controller.dart';
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendanceSummaryView extends StatefulWidget {
  @override
  _AttendanceSummaryViewState createState() => _AttendanceSummaryViewState();
}

class _AttendanceSummaryViewState extends State<AttendanceSummaryView> with TickerProviderStateMixin {
  var _calendarCt = CalendarController();
  AnimationController _animationCt;
  var _attendanceSummaryCt = Get.put(AttendanceSummaryController());

  _showDatePicker(BuildContext context, String selectedDate, Function (String date) onPick) {

    FocusScope.of(context).requestFocus(FocusNode());

    var temporaryDate = selectedDate == '' ? TextUtil.getCurrentDate('MMMM yyyy') : selectedDate;

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return DateTimePickerComponent(
            onPick: () {
              onPick(temporaryDate);
              _calendarCt.setFocusedDay(TextUtil.convertStringToDateTime(temporaryDate, 'MMMM yyyy'));
              Get.back();
            },
            pickerType: DateTimePickerType.monthYear,
            onChanged: (DateTime date) => temporaryDate = TextUtil.dateTimeToString(date, 'MMMM yyyy'),
            pickerModel: CustomDatePicker(
                currentTime: TextUtil.convertStringToDateTime(selectedDate, 'MMMM yyyy'),
                maxTime: DateTime(DateTime.now().year + 20, 12, 31),
                locale: commonController.language.value == Constant.INDONESIAN ? LocaleType.id : LocaleType.en
            ),
          );
        }
    );
  }

  Widget _content(String title, String content, bool isAttachment) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: ThemeTextStyle.biryaniBold.apply(color: Color(0xFFC4C4C4), fontSizeDelta: 10.ssp),),
          Text(content, style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 14.ssp, color: isAttachment ? Color(0xFF158AC9) : Color(0xFF181921), decoration: isAttachment ? TextDecoration.underline : null),),
        ],
      ),
    );
  }

  Widget _detailSummary() {
    return _attendanceSummaryCt.loadingSummary.value ?
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 20.w, width: 20.w,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(ThemeColor.primary),
          ),
        )
      ],
    ) : _attendanceSummaryCt.listSummary.any((element) => element.startDate == _attendanceSummaryCt.selectedDay.value) ?
    CupertinoScrollbar(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h,),
              Row(
                children: [
                  _content('START (HOUR)', (_attendanceSummaryCt?.selectedSummary?.value?.startHour ?? '') == '' ? '-' : _attendanceSummaryCt?.selectedSummary?.value?.startHour ?? '-', false),
                  SizedBox(width: 10.w,),
                  _content('END (HOUR)', (_attendanceSummaryCt?.selectedSummary?.value?.endHour ?? '') == '' ? '-' : _attendanceSummaryCt?.selectedSummary?.value?.endHour ?? '-', false),
                ],
              ),
              SizedBox(height: 24.h,),
              Text('DESCRIPTION', style: ThemeTextStyle.biryaniBold.apply(color: Color(0xFFC4C4C4), fontSizeDelta: 10.ssp),),
              SizedBox(height: 8.h,),
              Parent(
                gesture: Gestures()..onTap(() {}),
                style: ParentStyle()..background.color(Color(0xFFE9EAEA))..borderRadius(all: 8)..padding(horizontal: 16, vertical: 18)
                    ..width(Get.width),
                child: Text((_attendanceSummaryCt?.selectedSummary?.value?.description ?? '') == '' ? 'No description' : _attendanceSummaryCt?.selectedSummary?.value?.description ?? '-', style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 14.ssp, color: Color(0xFF181921)),)
              )
            ],
          ),
        ),
      ),
    ) :
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EmptyText(text: 'Empty attendance request'),
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    _animationCt = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _animationCt.forward();

    Future.delayed(Duration.zero, () {
      _attendanceSummaryCt.getSummary();
    });
  }

  @override
  void dispose() {
    _calendarCt.dispose();
    _animationCt.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Column(
        children: [
          Parent(
            style: ParentStyle()..background.color(Color(0xFFF8AC58))..width(Get.width),
            child: Stack(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: context.mediaQueryPadding.top + 15.h, bottom: 36.h),
                      child: SvgPicture.asset('assets/images/summary_detail_flower.svg', width: Get.width * 0.2, height: Get.height * 0.25,),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.end,
                ),
                Positioned(
                  left: 0, right: 0, bottom: 14.h,
                  child: Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => _showDatePicker(context, _attendanceSummaryCt.visibleMonth.value, (date) {
                            _attendanceSummaryCt.setVisibleMonth(date);
                          }),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(_attendanceSummaryCt.visibleMonth.value, style: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 18.ssp),),
                                ),
                                Icon(Icons.arrow_drop_down, color: Colors.white, size: 24.w,)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 24.h,),
                        TableCalendar(
                          availableCalendarFormats: {
                            CalendarFormat.week: 'Week',
                          },
                          calendarController: _calendarCt,
                          locale: commonController.language.value,
                          initialCalendarFormat: CalendarFormat.week,
                          startDay: DateTime(DateTime.now().year - 2),
                          endDay: DateTime(DateTime.now().year + 2),
                          onDaySelected: (date, _, __) {
                            _attendanceSummaryCt.setSelectedDay(TextUtil.dateTimeToString(date, 'dd/MM/yyyy'));
                            _animationCt.reset();
                            _animationCt.forward();
                          },
                          onVisibleDaysChanged: (dateFirst, _, __) => _attendanceSummaryCt.setVisibleMonth(TextUtil.dateTimeToString(dateFirst, 'MMMM yyyy')),
                          initialSelectedDay: DateTime.now(),
                          headerVisible: false,
                          builders: CalendarBuilders(
                            selectedDayBuilder: (context, date, _) {
                              return FadeTransition(
                                opacity: Tween(begin: 0.0, end: 1.0).animate(_animationCt),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Parent(
                                      style: ParentStyle()..background.color(ThemeColor.secondary)..borderRadius(all: 6)
                                        ..padding(horizontal: 8.w)..height(45.h),
                                      child: Center(child: Text('${date.day}', style: ThemeTextStyle.biryaniExtraBold.apply(color: Colors.white, fontSizeDelta: 16.ssp),)),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          headerStyle: HeaderStyle(
                            leftChevronVisible: false, rightChevronVisible: false,
                            titleTextStyle: ThemeTextStyle.biryaniExtraBold.apply(color: Colors.white, fontSizeDelta: 16.ssp)
                          ),
                          daysOfWeekStyle: DaysOfWeekStyle(
                            weekdayStyle: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 10.ssp),
                            weekendStyle: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 10.ssp)
                          ),
                          calendarStyle: CalendarStyle(
                            todayColor: Colors.transparent,
                            // selectedColor: ThemeColor.secondary,
                            weekdayStyle: ThemeTextStyle.biryaniExtraBold.apply(color: Colors.white, fontSizeDelta: 16.ssp),
                            weekendStyle: ThemeTextStyle.biryaniExtraBold.apply(color: Colors.white, fontSizeDelta: 16.ssp),
                            holidayStyle: ThemeTextStyle.biryaniExtraBold.apply(color: Colors.white, fontSizeDelta: 16.ssp),
                            unavailableStyle: ThemeTextStyle.biryaniExtraBold.apply(color: Colors.white, fontSizeDelta: 16.ssp),
                            todayStyle: ThemeTextStyle.biryaniExtraBold.apply(color: Colors.white, fontSizeDelta: 16.ssp),
                            // selectedStyle: ThemeTextStyle.biryaniExtraBold.apply(color: Colors.white, fontSizeDelta: 16.ssp),
                            outsideWeekendStyle: ThemeTextStyle.biryaniExtraBold.apply(color: Colors.white, fontSizeDelta: 16.ssp),
                            eventDayStyle: ThemeTextStyle.biryaniExtraBold.apply(color: Colors.white, fontSizeDelta: 16.ssp),
                            outsideHolidayStyle: ThemeTextStyle.biryaniExtraBold.apply(color: Colors.white, fontSizeDelta: 16.ssp),
                            outsideStyle: ThemeTextStyle.biryaniExtraBold.apply(color: Colors.white, fontSizeDelta: 16.ssp)
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: context.mediaQueryPadding.top + 24.w, left: 24.w),
                  child: ButtonBack(label: 'Attendance', onBack: () => Get.back(), whiteColor: true,),
                )
              ],
            ),
          ),
          Expanded(
            child: Obx(() => _detailSummary()),
          )
        ],
      ),
    );
  }
}
