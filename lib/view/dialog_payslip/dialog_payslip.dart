import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/core/widgets/custom_date_picker.dart';
import 'package:kukelola_flutter/core/widgets/input_tap.dart';
import 'package:kukelola_flutter/view/dialog_payslip/dialog_payslip_controller.dart';

import '../../main.dart';

class DialogPayslip extends StatelessWidget {
  var _dialogPayslipCt = Get.find<DialogPayslipController>();

  _showDatePicker(BuildContext context, String selectedDate, Function (String date) onPick) {

    FocusScope.of(context).requestFocus(FocusNode());

    var temporaryDate = '';

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return DateTimePickerComponent(
            onPick: () {
              onPick(temporaryDate);
              Navigator.pop(context);
            },
            onChanged: (DateTime date) => temporaryDate = TextUtil.dateTimeToString(date, 'MM/yyyy'),
            pickerModel: CustomDatePicker(
                currentTime: TextUtil.convertStringToDateTime(selectedDate, 'MM/yyyy'),
                minTime: DateTime.now(),
                maxTime: DateTime(DateTime.now().year + 20, 12, 31),
                locale: commonController.language.value == Constant.INDONESIAN ? LocaleType.id : LocaleType.en
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      elevation: 0,
      content: Parent(
        style: ParentStyle()..borderRadius(all: 16)..background.color(Colors.white)
          ..maxHeight(Get.height - (Get.height * (0.05 * 2)))
          ..width(Get.width - (24.w * 2)),
        child: SingleChildScrollView(
          child: Obx(() => Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text('Add Details', maxLines: 2, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.biryaniBold.apply(fontSizeDelta: 18.ssp, decoration: TextDecoration.none),),
                    ),
                    SizedBox(width: 10.w,),
                    Parent(
                      gesture: Gestures()..onTap(() => Get.back()),
                      style: ParentStyle()..background.color(Color(0xFFED5565))..height(24.w)..width(24.w)..borderRadius(all: 4),
                      child: Center(
                        child: SvgPicture.asset('assets/images/fa-solid_times.svg', width: 11.w, height: 16.h,),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 24.h,),
                InputTap(
                  labelText: 'CHOOSE MONTH',
                  hintText: '',
                  onTap: () => _showDatePicker(context, _dialogPayslipCt.date.value, (date) {
                    _dialogPayslipCt.setDate(date);
                  }),
                  rightIcon: '',
                  leftSize: Size(14.w, 16.h),
                  value: _dialogPayslipCt.date.value,
                  leftIcon: 'assets/images/fa-solid_calendar-day.svg',
                ),
                SizedBox(height: 24.h,),
                ButtonLoading(
                  backgroundColor: ThemeColor.secondary,
                  disable: _dialogPayslipCt.loadingDownload.value,
                  title: 'Download Payslip',
                  loading: _dialogPayslipCt.loadingDownload.value,
                  onTap: () async {
                    await _dialogPayslipCt.downloadPayslip();
                    Get.back();
                  },
                  verticalPadding: 10.h,
                  textStyle: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 14.ssp),
                ),
              ],
            )),
        ),
      ),
    );
  }
}
