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
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:kukelola_flutter/view/leave_request/leave_request_controller.dart';

class LeaveRequestView extends StatefulWidget {
  @override
  _LeaveRequestViewState createState() => _LeaveRequestViewState();
}

class _LeaveRequestViewState extends State<LeaveRequestView> {

  var _typeKey = GlobalKey();
  var _reasonCt = TextEditingController();
  var _reasonFocus = FocusNode();
  var _leaveRequestCt = Get.put(LeaveRequestController());

  _showDatePicker(BuildContext context, String selectedDate, Function (String date) onPick) {

    FocusScope.of(context).requestFocus(FocusNode());

    var temporaryDate = '';

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return DatePickerComponent(
            onPick: () {
              onPick(temporaryDate);
              print('selected date $temporaryDate');
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

  _pickFile() async {
    _leaveRequestCt.setLoadingPickFile(true);
    FilePickerResult result = await FilePicker.platform.pickFiles(type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'png', 'jpeg', 'JPG'],);
    _leaveRequestCt.setLoadingPickFile(false);

    if(result != null) {
      File file = File(result.files.single.path);
      _leaveRequestCt.setFilePath(file.path);
    } else {
      Fluttertoast.showToast(msg: 'Canceled the picker.', backgroundColor: Colors.black.withOpacity(0.6));
    }
  }

  _showDropdownType(BuildContext context) {

    FocusScope.of(context).requestFocus(FocusNode());

    final RenderBox renderBoxRed = _typeKey.currentContext.findRenderObject();
    final position = renderBoxRed.localToGlobal(Offset.zero);

    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      child: Stack(
        children: [
          Container(width: Get.width, height: Get.height,),
          Positioned(
            left: 24.w, right: 24.w,
            top: position.dy > Get.height - 150.h ? Get.height / 2 : position.dy + context.mediaQueryPadding.top,
            child: Column(
              children: [
                Parent(
                  style: ParentStyle()..width(Get.width)..maxHeight(150.h)..borderRadius(bottomLeft: 6, bottomRight: 6)
                    ..background.color(Colors.white)..boxShadow(color: Colors.black.withOpacity(0.05), blur: 6, spread: 0, offset: Offset(0, 2)),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: _leaveRequestCt.listLeaveType.length,
                    itemBuilder: (_, index) => ListStandartDropdownItem(
                      content: _leaveRequestCt.listLeaveType[index].label,
                      onClick: () {
                        _leaveRequestCt.setLeaveType(_leaveRequestCt.listLeaveType[index].label);
                        Navigator.pop(context);
                      },
                    ),
                    separatorBuilder: (_, __) => Divider(color: Colors.transparent, height: 5.h,),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      _leaveRequestCt.populateLeaveType();
    });
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
                    label: 'Leave Request',
                    onBack: () => Get.back(),
                  ),
                ),
                SizedBox(width: 10.w,),
                ButtonLoading(
                  backgroundColor: ThemeColor.primary,
                  disable: _leaveRequestCt.loadingSubmit.value,
                  title: 'Submit',
                  loading: _leaveRequestCt.loadingSubmit.value,
                  onTap: () => _leaveRequestCt.submitLeaveRequest(),
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
                          key: _typeKey,
                          labelText: 'TYPE',
                          hintText: 'pick leave type...',
                          onTap: () => _showDropdownType(context),
                          rightIcon: 'assets/images/fa-solid_caret-down.svg',
                          rightSize: Size(10.w, 16.h),
                          value: _leaveRequestCt.leaveType.value,
                        ),
                        SizedBox(height: 24.h,),
                        InputTap(
                          labelText: 'START DATE',
                          hintText: '',
                          onTap: () => _showDatePicker(context, _leaveRequestCt.startDate.value, (date) {
                            _leaveRequestCt.setStartDate(date);
                          }),
                          rightIcon: '',
                          leftSize: Size(14.w, 16.h),
                          value: _leaveRequestCt.startDate.value,
                          leftIcon: 'assets/images/fa-solid_calendar-day.svg',
                        ),
                        SizedBox(height: 24.h,),
                        InputTap(
                          labelText: 'END DATE',
                          hintText: '',
                          onTap: () => _showDatePicker(context, _leaveRequestCt.endDate.value, (date) {
                            _leaveRequestCt.setEndDate(date);
                          }),
                          rightIcon: '',
                          leftSize: Size(14.w, 16.h),
                          value: _leaveRequestCt.endDate.value,
                          leftIcon: 'assets/images/fa-solid_calendar-day.svg',
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
                          loading: _leaveRequestCt.loadingPickFile.value,
                          value: _leaveRequestCt.filePath.value.path == '' ? '' : '${_leaveRequestCt.filePath.value.path} (${(_leaveRequestCt.filePath.value.lengthSync() / 1024).round()} KB)',
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
