import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/core/widgets/custom_date_picker.dart';
import 'package:kukelola_flutter/core/widgets/custom_input.dart';
import 'package:kukelola_flutter/core/widgets/input_tap.dart';
import 'package:kukelola_flutter/core/widgets/list_standart_dropdown_item.dart';
import 'package:kukelola_flutter/view/leave_summary/leave_summary_controller.dart';
import 'package:kukelola_flutter/view/leave_summary/view/leave_summary_filter_controller.dart';
import 'package:kukelola_flutter/view/overtime_summary/view/overtime_summary_filter_controller.dart';
import 'package:kukelola_flutter/view/workflow_approval/controller/workflow_approval_filter_controller.dart';

import '../../../main.dart';

class OvertimeSummaryFilter extends StatelessWidget {

  var _overtimeSummaryFilterCt = Get.find<OvertimeSummaryFilterController>();

  _showDatePicker(BuildContext context, String selectedDate, Function (String date) onPick) {

    FocusScope.of(context).requestFocus(FocusNode());

    var temporaryDate = selectedDate == '' ? TextUtil.getCurrentDate('dd/MM/yyyy') : selectedDate;

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return DateTimePickerComponent(
            onPick: () {
              onPick(temporaryDate);
              Get.back();
            },
            onChanged: (DateTime date) => temporaryDate = TextUtil.dateTimeToString(date, 'dd/MM/yyyy'),
            pickerModel: CustomDatePicker(
                currentTime: TextUtil.convertStringToDateTime(selectedDate == '' ? TextUtil.getCurrentDate('dd/MM/yyyy') : selectedDate, 'dd/MM/yyyy'),
                minTime: DateTime(DateTime.now().year - 1),
                maxTime: DateTime(DateTime.now().year + 20, 12, 31),
                locale: commonController.language.value == Constant.INDONESIAN ? LocaleType.id : LocaleType.en
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: ParentStyle()..background.color(Colors.white)..borderRadius(all: 6),
      child: CupertinoScrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 24.h,),
                InputTap(
                  labelText: 'Start Date',
                  hintText: 'e.g ${TextUtil.getCurrentDate('dd/MM/yyyy')}',
                  onTap: () => _showDatePicker(context, _overtimeSummaryFilterCt.startDate.value, (date) {
                    _overtimeSummaryFilterCt.setStartDate(date);
                  }),
                  rightIcon: '',
                  leftSize: Size(14.w, 16.h),
                  value: _overtimeSummaryFilterCt.startDate.value,
                  leftIcon: 'assets/images/fa-solid_calendar-day.svg',
                ),
                SizedBox(height: 16.h,),
                InputTap(
                  labelText: 'End Date',
                  hintText: 'e.g ${TextUtil.dateTimeToString(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 4), 'dd/MM/yyyy')}',
                  onTap: () => _showDatePicker(context, _overtimeSummaryFilterCt.endDate.value, (date) {
                    _overtimeSummaryFilterCt.setEndDate(date);
                  }),
                  rightIcon: '',
                  leftSize: Size(14.w, 16.h),
                  value: _overtimeSummaryFilterCt.endDate.value,
                  leftIcon: 'assets/images/fa-solid_calendar-day.svg',
                ),
                SizedBox(height: 24.h,),
                Row(
                  children: [
                    Expanded(
                      child: ButtonLoading(
                        backgroundColor: ThemeColor.secondary,
                        disable: false,
                        title: 'Filter',
                        loading: false,
                        verticalPadding: 7.h,
                        onTap: () => _overtimeSummaryFilterCt.filter(),
                        textStyle: ThemeTextStyle.biryaniSemiBold.apply(fontSizeDelta: 10.ssp, color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    Expanded(
                      child: ButtonLoading(
                        backgroundColor: ThemeColor.primary,
                        disable: false,
                        title: 'Reset',
                        loading: false,
                        verticalPadding: 7.h,
                        onTap: () => _overtimeSummaryFilterCt.reset(),
                        textStyle: ThemeTextStyle.biryaniSemiBold.apply(fontSizeDelta: 10.ssp, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h,)
              ],
            ),
            ),
          ),
        ),
      ),
    );
  }
}
