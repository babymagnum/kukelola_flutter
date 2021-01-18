import 'dart:io';
import 'package:division/division.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/core/widgets/custom_date_picker.dart';
import 'package:kukelola_flutter/core/widgets/custom_input.dart';
import 'package:kukelola_flutter/core/widgets/input_attachment.dart';
import 'package:kukelola_flutter/core/widgets/input_tap.dart';
import 'package:kukelola_flutter/core/widgets/list_standart_dropdown_item.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/view/attendance_request/attendance_request_controller.dart';
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:kukelola_flutter/view/leave_request/leave_request_controller.dart';

class AttendanceRequestView extends StatefulWidget {
  @override
  AttendanceRequestViewState createState() => AttendanceRequestViewState();
}

class AttendanceRequestViewState extends State<AttendanceRequestView> {

  var _reasonCt = TextEditingController();
  var _reasonFocus = FocusNode();
  var _attendanceRequestCt = Get.put(AttendanceRequestController());

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
              print('tempo time $temporaryDate');
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
    _attendanceRequestCt.setLoadingPickFile(true);
    FilePickerResult result = await FilePicker.platform.pickFiles(type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'png', 'jpeg', 'JPG'],);
    _attendanceRequestCt.setLoadingPickFile(false);

    if(result != null) {
      File file = File(result.files.single.path);
      _attendanceRequestCt.setFilePath(file.path);
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
                    label: 'Attendance Request',
                    onBack: () => Get.back(),
                  ),
                ),
                SizedBox(width: 10.w,),
                ButtonLoading(
                  backgroundColor: ThemeColor.primary,
                  disable: _attendanceRequestCt.loadingSubmit.value,
                  title: 'Submit',
                  loading: _attendanceRequestCt.loadingSubmit.value,
                  onTap: () => _attendanceRequestCt.submitLeaveRequest(),
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
                          labelText: 'START DATE',
                          hintText: '',
                          onTap: () => _showDatePicker(context, _attendanceRequestCt.startDate.value, (date) {
                            _attendanceRequestCt.setStartDate(date);
                          }),
                          rightIcon: '',
                          leftSize: Size(14.w, 16.h),
                          value: _attendanceRequestCt.startDate.value,
                          leftIcon: 'assets/images/fa-solid_calendar-day.svg',
                        ),
                        SizedBox(height: 24.h,),
                        InputTap(
                          labelText: 'END DATE',
                          hintText: '',
                          onTap: () => _showDatePicker(context, _attendanceRequestCt.endDate.value, (date) {
                            _attendanceRequestCt.setEndDate(date);
                          }),
                          rightIcon: '',
                          leftSize: Size(14.w, 16.h),
                          value: _attendanceRequestCt.endDate.value,
                          leftIcon: 'assets/images/fa-solid_calendar-day.svg',
                        ),
                        SizedBox(height: 24.h,),
                        InputTap(
                          labelText: 'HOUR (START)',
                          hintText: '',
                          onTap: () => _showTimePicker(context, _attendanceRequestCt.startHour.value, (time) => _attendanceRequestCt.setStartHour(time)),
                          rightIcon: '',
                          leftSize: Size(14.w, 16.h),
                          value: _attendanceRequestCt.startHour.value,
                          leftIcon: 'assets/images/fa-solid_clock.svg',
                        ),
                        SizedBox(height: 24.h,),
                        InputTap(
                          labelText: 'HOUR (END)',
                          hintText: '',
                          onTap: () => _showTimePicker(context, _attendanceRequestCt.endHour.value, (time) => _attendanceRequestCt.setEndHour(time)),
                          rightIcon: '',
                          leftSize: Size(14.w, 16.h),
                          value: _attendanceRequestCt.endHour.value,
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
                          loading: _attendanceRequestCt.loadingPickFile.value,
                          value: _attendanceRequestCt.filePath.value.path == '' ? '' : '${_attendanceRequestCt.filePath.value.path} (${(_attendanceRequestCt.filePath.value.lengthSync() / 1024).round()} KB)',
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
