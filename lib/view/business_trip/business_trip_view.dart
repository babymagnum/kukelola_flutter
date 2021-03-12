import 'dart:async';
import 'dart:io';
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
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/core/widgets/custom_date_picker.dart';
import 'package:kukelola_flutter/core/widgets/custom_input.dart';
import 'package:kukelola_flutter/core/widgets/input_attachment.dart';
import 'package:kukelola_flutter/core/widgets/input_tap.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:kukelola_flutter/view/business_trip/business_trip_controller.dart';
import 'package:kukelola_flutter/view/business_trip_detail/business_trip_detail_view.dart';

class BusinessTripView extends StatefulWidget {
  @override
  BusinessTripViewState createState() => BusinessTripViewState();
}

class BusinessTripViewState extends State<BusinessTripView> {

  var _destinationFocus = FocusNode(), _purposeFocus = FocusNode();
  var _destinationCt = TextEditingController(), _purporseCt = TextEditingController();
  var _businessTripCt = Get.put(BusinessTripController());
  StreamSubscription _keyboardStream;

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
                minTime: DateTime(DateTime.now().year - 1),
                maxTime: DateTime(DateTime.now().year + 20, 12, 31),
                locale: commonController.language.value == Constant.INDONESIAN ? LocaleType.id : LocaleType.en
            ),
          );
        }
    );
  }

  _pickFile() async {
    _businessTripCt.setLoadingPickFile(true);
    FilePickerResult result = await FilePicker.platform.pickFiles(type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'png', 'jpeg', 'JPG'],);
    _businessTripCt.setLoadingPickFile(false);

    if(result != null) {
      File file = File(result.files.single.path);
      _businessTripCt.form.value.attachment = File(file.path);
      _businessTripCt.setForm(_businessTripCt.form.value);
      setState(() {});
    } else {
      CommonFunction.standartSnackbar('Canceled the picker.');
    }
  }

  bool _disable() {
    var form = _businessTripCt.form.value;
    return form.destination == '' || form.startDate == '' || form.endDate == '' || form.purpose == '';
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
    _destinationCt.dispose();
    _purporseCt.dispose();
    _keyboardStream?.cancel();

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
                    label: 'Business Trip',
                    onBack: () => Get.back(),
                  ),
                ),
                SizedBox(width: 10.w,),
                ButtonLoading(
                  backgroundColor: ThemeColor.primary,
                  disable: _businessTripCt.loadingSubmit.value || _disable(),
                  title: 'Next',
                  loading: _businessTripCt.loadingSubmit.value,
                  onTap: () async {
                    await Get.to(BusinessTripDetailView());

                    if (_businessTripCt.form.value.destination == '') {
                      setState(() {
                        _destinationCt.text = '';
                        _purporseCt.text = '';
                      });
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
                        labelText: 'START DATE',
                        hintText: '',
                        onTap: () => _showDatePicker(context, _businessTripCt.form.value.startDate, (date) {
                          _businessTripCt.form.value.startDate = date;
                          _businessTripCt.setForm(_businessTripCt.form.value);
                        }),
                        rightIcon: '',
                        leftSize: Size(14.w, 16.h),
                        value: _businessTripCt.form.value.startDate,
                        leftIcon: 'assets/images/fa-solid_calendar-day.svg',
                      ),
                      SizedBox(height: 24.h,),
                      InputTap(
                        labelText: 'END DATE',
                        hintText: '',
                        onTap: () => _showDatePicker(context, _businessTripCt.form.value.endDate, (date) {
                          _businessTripCt.form.value.endDate = date;
                          _businessTripCt.setForm(_businessTripCt.form.value);
                        }),
                        rightIcon: '',
                        leftSize: Size(14.w, 16.h),
                        value: _businessTripCt.form.value.endDate,
                        leftIcon: 'assets/images/fa-solid_calendar-day.svg',
                      ),
                      SizedBox(height: 24.h,),
                      CustomInput(
                        textInputAction: null,
                        focusNode: _destinationFocus,
                        labelText: 'DESTINATION',
                        controller: _destinationCt,
                        hintText: 'type destination...',
                        inputType: TextInputType.text,
                        onEditingComplete: () {},
                        maxLines: 1,
                        onChanged: (text) {
                          _businessTripCt.form.value.destination = text.trim();
                          _businessTripCt.setForm(_businessTripCt.form.value);
                          setState(() {});
                        },
                        onTap: () => setState(() => _destinationFocus.requestFocus()),
                      ),
                      SizedBox(height: 24.h,),
                      CustomInput(
                        textInputAction: null,
                        focusNode: _purposeFocus,
                        controller: _purporseCt,
                        labelText: 'PURPORSE',
                        hintText: 'type purpose...',
                        inputType: TextInputType.multiline,
                        onEditingComplete: () {},
                        maxLines: null,
                        onChanged: (text) {
                          _businessTripCt.form.value.purpose = text.trim();
                          _businessTripCt.setForm(_businessTripCt.form.value);
                          setState(() {});
                        },
                        onTap: () => setState(() => _purposeFocus.requestFocus()),
                      ),
                      SizedBox(height: 24.h,),
                      InputAttachment(
                        labelText: 'ATTACHMENT (OPTIONAL)',
                        hintText: 'selected file...',
                        onTap: () => _pickFile(),
                        loading: _businessTripCt.loadingPickFile.value,
                        value: _businessTripCt.form.value.attachment.path == '' ? '' : '${_businessTripCt.form.value.attachment.path} (${(_businessTripCt.form.value.attachment.lengthSync() / 1024).round()} KB)',
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
