import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/core/widgets/custom_date_picker.dart';
import 'package:kukelola_flutter/core/widgets/custom_input.dart';
import 'package:kukelola_flutter/core/widgets/input_attachment.dart';
import 'package:kukelola_flutter/core/widgets/input_tap.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/view/attendance_request/attendance_request_controller.dart';
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:kukelola_flutter/view/overtime_request/overtime_request_controller.dart';

class OvertimeRequestView extends StatefulWidget {
  @override
  OvertimeRequestViewState createState() => OvertimeRequestViewState();
}

class OvertimeRequestViewState extends State<OvertimeRequestView> {

  var _reasonCt = TextEditingController();
  var _reasonFocus = FocusNode();
  var _overtimeRequestCt = Get.put(OvertimeRequestController());

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
            onChanged: (DateTime date) => temporaryDate = TextUtil.dateTimeToString(date, 'dd/MM/yyyy'),
            pickerModel: CustomDatePicker(
                currentTime: TextUtil.convertStringToDateTime(selectedDate, 'dd/MM/yyyy'),
                minTime: DateTime.now(),
                maxTime: DateTime(DateTime.now().year + 20, 12, 31),
                locale: commonController.language.value == Constant.INDONESIAN ? LocaleType.id : LocaleType.en
            ),
          );
        }
    );
  }

  _showTimePicker(BuildContext context, String selectedTime, Function (String time) onPick) {

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
            onChanged: (DateTime date) => temporaryDate = TextUtil.dateTimeToString(date, 'HH:mm'),
            pickerModel: CustomTimePicker(
              currentTime: TextUtil.convertStringToDateTime(selectedTime, 'HH:mm'),
              locale: commonController.language.value == Constant.INDONESIAN ? LocaleType.id : LocaleType.en,
              showSecondsColumn: false
            ),
          );
        }
    );
  }

  _pickFile() async {
    _overtimeRequestCt.setLoadingPickFile(true);
    FilePickerResult result = await FilePicker.platform.pickFiles(type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'png', 'jpeg', 'JPG'],);
    _overtimeRequestCt.setLoadingPickFile(false);

    if(result != null) {
      File file = File(result.files.single.path);
      _overtimeRequestCt.setFilePath(file.path);
    } else {
      Fluttertoast.showToast(msg: 'Canceled the picker.', backgroundColor: Colors.black.withOpacity(0.6));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Column(
        children: [
          SizedBox(height: context.mediaQueryPadding.top + 24.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Obx(() => Row(
              children: [
                Expanded(
                  child: ButtonBack(
                    label: 'Overtime Request',
                    onBack: () => Get.back(),
                  ),
                ),
                SizedBox(width: 10.w,),
                ButtonLoading(
                  backgroundColor: ThemeColor.primary,
                  disable: _overtimeRequestCt.loadingSubmit.value,
                  title: 'Submit',
                  loading: _overtimeRequestCt.loadingSubmit.value,
                  onTap: () => _overtimeRequestCt.submitLeaveRequest(),
                  verticalPadding: 6.h,
                  horizontalPadding: 15.w,
                  loadingSize: 12.w,
                  textStyle: ThemeTextStyle.biryaniSemiBold.apply(color: Colors.white, fontSizeDelta: 12.ssp),
                )
              ],
            ),
            ),
          ),
          Expanded(
            child: CupertinoScrollbar(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Obx(() => Column(
                      children: [
                        SizedBox(height: 32.h,),
                        InputTap(
                          labelText: 'OVERTIME DATE',
                          hintText: '',
                          onTap: () => _showDatePicker(context, _overtimeRequestCt.overtimeDate.value, (date) {
                            _overtimeRequestCt.setOvertimeDate(date);
                          }),
                          rightIcon: '',
                          leftSize: Size(14.w, 16.h),
                          value: _overtimeRequestCt.overtimeDate.value,
                          leftIcon: 'assets/images/fa-solid_calendar-day.svg',
                        ),
                        SizedBox(height: 24.h,),
                        InputTap(
                          labelText: 'HOUR (START)',
                          hintText: '',
                          onTap: () => _showTimePicker(context, _overtimeRequestCt.startHour.value, (time) => _overtimeRequestCt.setStartHour(time)),
                          rightIcon: '',
                          leftSize: Size(14.w, 16.h),
                          value: _overtimeRequestCt.startHour.value,
                          leftIcon: 'assets/images/fa-solid_clock.svg',
                        ),
                        SizedBox(height: 24.h,),
                        InputTap(
                          labelText: 'HOUR (END)',
                          hintText: '',
                          onTap: () => _showTimePicker(context, _overtimeRequestCt.endHour.value, (time) => _overtimeRequestCt.setEndHour(time)),
                          rightIcon: '',
                          leftSize: Size(14.w, 16.h),
                          value: _overtimeRequestCt.endHour.value,
                          leftIcon: 'assets/images/fa-solid_clock.svg',
                        ),
                        SizedBox(height: 24.h,),
                        CustomInput(
                          textInputAction: null,
                          focusNode: _reasonFocus,
                          labelText: 'REASON',
                          hintText: 'type reason...',
                          inputType: TextInputType.multiline,
                          onEditingComplete: () {},
                          maxLines: null,
                          onTap: () => setState(() => _reasonFocus.requestFocus()),
                        ),
                        SizedBox(height: 24.h,),
                        InputAttachment(
                          labelText: 'ATTACHMENT (OPTIONAL)',
                          hintText: 'selected file...',
                          onTap: () => _pickFile(),
                          loading: _overtimeRequestCt.loadingPickFile.value,
                          value: _overtimeRequestCt.filePath.value.path == '' ? '' : '${_overtimeRequestCt.filePath.value.path} (${(_overtimeRequestCt.filePath.value.lengthSync() / 1024).round()} KB)',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
