import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/core/widgets/custom_date_picker.dart';
import 'package:kukelola_flutter/core/widgets/custom_input.dart';
import 'package:kukelola_flutter/core/widgets/input_tap.dart';
import 'package:kukelola_flutter/view/add_family/add_family_controller.dart';
import 'package:kukelola_flutter/view/base_view.dart';

import '../../main.dart';

class AddFamilyView extends StatefulWidget {
  @override
  _AddFamilyViewState createState() => _AddFamilyViewState();
}

class _AddFamilyViewState extends State<AddFamilyView> {

  var _addFamiliesCt = Get.put(AddFamilyController());
  var _nameFocus = FocusNode(), _relationFocus = FocusNode(), _idFocus = FocusNode(),
      _occupationFocus = FocusNode(), _phoneFocus = FocusNode();

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
                maxTime: DateTime(DateTime.now().year + 20, 12, 31),
                minTime: DateTime(1940),
                locale: commonController.language.value == Constant.INDONESIAN ? LocaleType.id : LocaleType.en
            ),
          );
        }
    );
  }

  bool _disable() {
    var form = _addFamiliesCt.form.value;
    return form.name == '' || form.relation == '' || form.id == '' || form.occupation == '' || form.dateOfBirth == '' || form.phone == '';
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
                    label: 'Add Family',
                    onBack: () => Get.back(),
                  ),
                ),
                SizedBox(width: 10.w,),
                ButtonLoading(
                  backgroundColor: ThemeColor.primary,
                  disable: _addFamiliesCt.loadingSubmit.value || _disable(),
                  title: 'Save',
                  loading: _addFamiliesCt.loadingSubmit.value,
                  onTap: () async {
                    await _addFamiliesCt.submitEducation();
                    Get.back();
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
                child: Obx(() => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                      children: [
                        SizedBox(height: 32.h,),
                        CustomInput(
                          textInputAction: TextInputAction.next,
                          focusNode: _nameFocus,
                          hintText: 'e.g Arief Zainuri',
                          onChanged: (text) {
                            _addFamiliesCt.form.value.name = text;
                            _addFamiliesCt.updateForm(_addFamiliesCt.form.value);
                          },
                          inputType: TextInputType.name,
                          onEditingComplete: () => setState(() => _relationFocus.requestFocus()),
                          onTap: () => setState(() => _nameFocus.requestFocus()),
                          labelText: 'NAME',
                        ),
                        SizedBox(height: 24.h,),
                        CustomInput(
                          textInputAction: TextInputAction.next,
                          focusNode: _relationFocus,
                          hintText: 'e.g Saudara',
                          onChanged: (text) {
                            _addFamiliesCt.form.value.relation = text;
                            _addFamiliesCt.updateForm(_addFamiliesCt.form.value);
                          },
                          inputType: TextInputType.name,
                          onEditingComplete: () => setState(() => _idFocus.requestFocus()),
                          onTap: () => setState(() => _relationFocus.requestFocus()),
                          labelText: 'RELATION',
                        ),
                        SizedBox(height: 24.h,),
                        CustomInput(
                          textInputAction: TextInputAction.next,
                          focusNode: _idFocus,
                          hintText: 'e.g 3471129819282',
                          onChanged: (text) {
                            _addFamiliesCt.form.value.id = text;
                            _addFamiliesCt.updateForm(_addFamiliesCt.form.value);
                          },
                          inputType: TextInputType.number,
                          onEditingComplete: () => _occupationFocus.requestFocus(),
                          onTap: () => setState(() => _idFocus.requestFocus()),
                          labelText: 'ID',
                        ),
                        SizedBox(height: 24.h,),
                        CustomInput(
                          textInputAction: TextInputAction.done,
                          focusNode: _occupationFocus,
                          hintText: 'e.g Pegawai Swasta',
                          onChanged: (text) {
                            _addFamiliesCt.form.value.occupation = text;
                            _addFamiliesCt.updateForm(_addFamiliesCt.form.value);
                          },
                          inputType: TextInputType.name,
                          onEditingComplete: () => FocusScope.of(context).requestFocus(FocusNode()),
                          onTap: () => setState(() => _occupationFocus.requestFocus()),
                          labelText: 'OCCUPATION',
                        ),
                        SizedBox(height: 24.h,),
                        InputTap(
                          labelText: 'DATE OF BIRTH',
                          hintText: '20/05/1996',
                          onTap: () => _showDatePicker(context, _addFamiliesCt.form.value.dateOfBirth == '' ? TextUtil.getCurrentDate('dd/MM/yyyy') : _addFamiliesCt.form.value.dateOfBirth, (date) {
                            _addFamiliesCt.form.value.dateOfBirth = date;
                            _addFamiliesCt.updateForm(_addFamiliesCt.form.value);
                          }),
                          rightIcon: '',
                          leftSize: Size(14.w, 16.h),
                          value: _addFamiliesCt.form.value.dateOfBirth,
                          leftIcon: 'assets/images/fa-solid_calendar-day.svg',
                        ),
                        SizedBox(height: 24.h,),
                        CustomInput(
                          textInputAction: TextInputAction.done,
                          focusNode: _phoneFocus,
                          hintText: 'e.g 085792810654',
                          onChanged: (text) {
                            _addFamiliesCt.form.value.phone = text;
                            _addFamiliesCt.updateForm(_addFamiliesCt.form.value);
                          },
                          inputType: TextInputType.phone,
                          onEditingComplete: () => FocusScope.of(context).requestFocus(FocusNode()),
                          onTap: () => setState(() => _phoneFocus.requestFocus()),
                          labelText: 'PHONE',
                        ),
                        SizedBox(height: 24.h,)
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
