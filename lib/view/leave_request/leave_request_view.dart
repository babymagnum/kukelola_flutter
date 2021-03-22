import 'dart:async';
import 'dart:io';
import 'package:division/division.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/core/widgets/button_reload.dart';
import 'package:kukelola_flutter/core/widgets/custom_date_picker.dart';
import 'package:kukelola_flutter/core/widgets/custom_input.dart';
import 'package:kukelola_flutter/core/widgets/input_attachment.dart';
import 'package:kukelola_flutter/core/widgets/input_tap.dart';
import 'package:kukelola_flutter/core/widgets/list_standart_dropdown_item.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/model/special_leave_list.dart';
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:kukelola_flutter/view/leave_request/leave_request_controller.dart';

class LeaveRequestView extends StatefulWidget {
  @override
  _LeaveRequestViewState createState() => _LeaveRequestViewState();
}

class _LeaveRequestViewState extends State<LeaveRequestView> {

  var _typeKey = GlobalKey(), _specialLeaveKey = GlobalKey();
  var _reasonFocus = FocusNode();
  var _reasonCt = TextEditingController();
  var _leaveRequestCt = Get.put(LeaveRequestController());
  StreamSubscription _keyboardStream;

  _showDatePicker(BuildContext context, String selectedDate, Function (String date) onPick) {

    FocusScope.of(context).requestFocus(FocusNode());

    var temporaryDate = selectedDate == '' ? TextUtil.getCurrentDate('dd/MM/yyyy') : selectedDate;

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
                minTime: DateTime(DateTime.now().year - 1),
                maxTime: DateTime(DateTime.now().year + 20, 12, 31),
                locale: commonController.language.value == Constant.INDONESIAN ? LocaleType.id : LocaleType.en
            ),
          );
        }
    );
  }

  _showDropdownType(BuildContext context, GlobalKey key, List<LeaveTypeItem> list, Function(LeaveTypeItem item) onSelect) {

    FocusScope.of(context).requestFocus(FocusNode());

    final RenderBox renderBoxRed = key.currentContext.findRenderObject();
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
                    itemCount: list.length,
                    itemBuilder: (_, index) => ListStandartDropdownItem(
                      content: list[index].label,
                      onClick: () {
                        onSelect(list[index]);
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

  _showDropdownSpecialLeaveType(BuildContext context, GlobalKey key, List<SpecialLeaveListData> list, Function(SpecialLeaveListData item) onSelect) {

    FocusScope.of(context).requestFocus(FocusNode());

    final RenderBox renderBoxRed = key.currentContext.findRenderObject();
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
                    itemCount: list.length,
                    itemBuilder: (_, index) => ListStandartDropdownItem(
                      content: list[index].text,
                      onClick: () {
                        onSelect(list[index]);
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

  _pickFile() async {
    _leaveRequestCt.setLoadingPickFile(true);
    FilePickerResult result = await FilePicker.platform.pickFiles(type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'png', 'jpeg', 'JPG'],);
    _leaveRequestCt.setLoadingPickFile(false);

    if(result != null) {
      File file = File(result.files.single.path);
      _leaveRequestCt.form.value.attachment = File(file.path);
      _leaveRequestCt.updateForm(_leaveRequestCt.form.value);
      setState(() {});
    } else {
      CommonFunction.standartSnackbar('Canceled the picker.');
    }
  }

  bool _disable() {
    var form = _leaveRequestCt.form.value;
    return form.leaveType.label == '' || (form.leaveType.label == 'Special Leave' ? form.specialLeaveType.label == '' : form.leaveType.label == '')
        || form.reason == '';
  }

  @override
  void initState() {
    super.initState();

    _keyboardStream = KeyboardVisibilityController().onChange.listen((bool visible) {
      if (!visible) FocusScope.of(context).requestFocus(FocusNode());
    });
  }

  @override
  void dispose() {
    _keyboardStream?.cancel();
    _reasonCt.dispose();

    super.dispose();
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
                  disable: _leaveRequestCt.loadingSubmit.value || _disable(),
                  title: 'Submit',
                  loading: _leaveRequestCt.loadingSubmit.value,
                  onTap: () async {
                    await _leaveRequestCt.submitLeaveRequest();

                    if (_leaveRequestCt.form.value.reason == '') {
                      setState(() => _reasonCt.text = '');
                    }
                  },
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
                          hintText: 'choose leave type...',
                          onTap: () => _showDropdownType(context, _typeKey, _leaveRequestCt.listLeaveType, (leaveType) {
                            _leaveRequestCt.form.value.leaveType = leaveType;
                            _leaveRequestCt.updateForm(_leaveRequestCt.form.value);

                            if (leaveType.label == 'Special Leave') _leaveRequestCt.populateSpecialLeaveType();
                          }),
                          rightIcon: 'assets/images/fa-solid_caret-down.svg',
                          rightSize: Size(10.w, 16.h),
                          value: _leaveRequestCt.form.value.leaveType.label,
                        ),
                        _leaveRequestCt.loadingSpecialLeaveType.value ?
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 24.h),
                            child: SizedBox(
                              width: 15.w, height: 15.w,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(ThemeColor.primary),
                              ),
                            ),
                          ),
                        ) :
                        _leaveRequestCt.errorSpecialLeaveType.value ?
                        ButtonReload(onTap: () => _leaveRequestCt.populateSpecialLeaveType()) :
                        AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          height: _leaveRequestCt.form.value.showSpecialType() ? commonController.inputTapHeight.value + 24.h : 0.0,
                          child: Padding(
                            padding: EdgeInsets.only(top: 24.h),
                            child: InputTap(
                              key: _specialLeaveKey,
                              labelText: 'SPECIAL LEAVE',
                              hintText: 'choose special leave...',
                              onTap: () {
                                _showDropdownSpecialLeaveType(context, _specialLeaveKey, _leaveRequestCt.listSpecialLeave, (leaveType) {
                                  _leaveRequestCt.form.value.specialLeaveType.label = leaveType.text;
                                  _leaveRequestCt.form.value.specialLeaveType.id = leaveType.id;
                                  _leaveRequestCt.updateForm(_leaveRequestCt.form.value);
                                });
                              },
                              rightIcon: 'assets/images/fa-solid_caret-down.svg',
                              rightSize: Size(10.w, 16.h),
                              value: _leaveRequestCt.form.value.specialLeaveType.label,
                            ),
                          ),
                        ),
                        SizedBox(height: 24.h,),
                        InputTap(
                          labelText: 'START DATE',
                          hintText: '',
                          onTap: () => _showDatePicker(context, _leaveRequestCt.form.value.startDate, (date) {
                            _leaveRequestCt.form.value.startDate = date;
                            _leaveRequestCt.updateForm(_leaveRequestCt.form.value);
                          }),
                          rightIcon: '',
                          leftSize: Size(14.w, 16.h),
                          value: _leaveRequestCt.form.value.startDate,
                          leftIcon: 'assets/images/fa-solid_calendar-day.svg',
                        ),
                        SizedBox(height: 24.h,),
                        InputTap(
                          labelText: 'END DATE',
                          hintText: '',
                          onTap: () => _showDatePicker(context, _leaveRequestCt.form.value.endDate, (date) {
                            _leaveRequestCt.form.value.endDate = date;
                            _leaveRequestCt.updateForm(_leaveRequestCt.form.value);
                          }),
                          rightIcon: '',
                          leftSize: Size(14.w, 16.h),
                          value: _leaveRequestCt.form.value.endDate,
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
                          onChanged: (text) {
                            _leaveRequestCt.form.value.reason = text.trim();
                            _leaveRequestCt.updateForm(_leaveRequestCt.form.value);
                            setState(() {});
                          },
                          onTap: () => setState(() => _reasonFocus.requestFocus()),
                        ),
                        SizedBox(height: 24.h,),
                        InputAttachment(
                          labelText: 'ATTACHMENT (OPTIONAL)',
                          hintText: 'selected file...',
                          onTap: () => _pickFile(),
                          loading: _leaveRequestCt.loadingPickFile.value,
                          value: _leaveRequestCt.form.value.attachment.path == '' ? '' : '${_leaveRequestCt.form.value.attachment.path.split('/').last} (${(_leaveRequestCt.form.value.attachment.lengthSync() / 1024).round()} KB)',
                          onDelete: () {
                            _leaveRequestCt.form.value.attachment = File('');
                            _leaveRequestCt.updateForm(_leaveRequestCt.form.value);
                            setState(() {});
                          },
                          showDelete: _leaveRequestCt.form.value.attachment.path != '',
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
