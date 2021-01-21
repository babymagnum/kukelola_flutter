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
import 'package:kukelola_flutter/view/add_working_experience/add_working_experience_controller.dart';
import 'package:kukelola_flutter/view/base_view.dart';

import '../../main.dart';

class AddWorkingExperienceView extends StatefulWidget {
  @override
  _AddWorkingExperienceViewState createState() => _AddWorkingExperienceViewState();
}

class _AddWorkingExperienceViewState extends State<AddWorkingExperienceView> {

  var _addWorkingExperienceCt = Get.put(AddWorkingExperienceController());
  var _lastPositionFocus = FocusNode(), _companyFocus = FocusNode(), _locationFocus = FocusNode(),
      _durationFocus = FocusNode();

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
            onChanged: (DateTime date) => temporaryDate = TextUtil.dateTimeToString(date, 'yyyy'),
            pickerModel: CustomDatePicker(
                currentTime: TextUtil.convertStringToDateTime(selectedDate, 'yyyy'),
                maxTime: DateTime(DateTime.now().year + 20, 12, 31),
                locale: commonController.language.value == Constant.INDONESIAN ? LocaleType.id : LocaleType.en
            ),
          );
        }
    );
  }

  bool _disable() {
    var form = _addWorkingExperienceCt.form.value;
    return form.lastPosition == '' || form.company == '' || form.location == '' || form.endYear == '' || form.duration == '';
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
                    label: 'Add Working Experience',
                    onBack: () => Get.back(),
                  ),
                ),
                SizedBox(width: 10.w,),
                ButtonLoading(
                  backgroundColor: ThemeColor.primary,
                  disable: _addWorkingExperienceCt.loadingSubmit.value || _disable(),
                  title: 'Save',
                  loading: _addWorkingExperienceCt.loadingSubmit.value,
                  onTap: () async {
                    await _addWorkingExperienceCt.submitEducation();
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
                          focusNode: _lastPositionFocus,
                          hintText: '',
                          onChanged: (text) {
                            _addWorkingExperienceCt.form.value.lastPosition = text;
                            _addWorkingExperienceCt.updateForm(_addWorkingExperienceCt.form.value);
                          },
                          inputType: TextInputType.name,
                          onEditingComplete: () => setState(() => _companyFocus.requestFocus()),
                          onTap: () => setState(() => _lastPositionFocus.requestFocus()),
                          labelText: 'LSAT POSITION',
                        ),
                        SizedBox(height: 24.h,),
                        CustomInput(
                          textInputAction: TextInputAction.next,
                          focusNode: _companyFocus,
                          hintText: '',
                          onChanged: (text) {
                            _addWorkingExperienceCt.form.value.company = text;
                            _addWorkingExperienceCt.updateForm(_addWorkingExperienceCt.form.value);
                          },
                          inputType: TextInputType.name,
                          onEditingComplete: () => setState(() => _locationFocus.requestFocus()),
                          onTap: () => setState(() => _companyFocus.requestFocus()),
                          labelText: 'COMPANY',
                        ),
                        SizedBox(height: 24.h,),
                        CustomInput(
                          textInputAction: TextInputAction.done,
                          focusNode: _locationFocus,
                          hintText: '',
                          onChanged: (text) {
                            _addWorkingExperienceCt.form.value.location = text;
                            _addWorkingExperienceCt.updateForm(_addWorkingExperienceCt.form.value);
                          },
                          inputType: TextInputType.number,
                          onEditingComplete: () => FocusScope.of(context).requestFocus(FocusNode()),
                          onTap: () => setState(() => _locationFocus.requestFocus()),
                          labelText: 'LOCATION',
                        ),
                        SizedBox(height: 24.h,),
                        InputTap(
                          labelText: 'END YEAR',
                          hintText: '',
                          onTap: () => _showDatePicker(context, _addWorkingExperienceCt.form.value.endYear == '' ? TextUtil.getCurrentDate('dd/MM/yyyy') : _addWorkingExperienceCt.form.value.endYear, (date) {
                            _addWorkingExperienceCt.form.value.endYear = date;
                            _addWorkingExperienceCt.updateForm(_addWorkingExperienceCt.form.value);
                          }),
                          rightIcon: '',
                          leftSize: Size(14.w, 16.h),
                          value: _addWorkingExperienceCt.form.value.endYear,
                          leftIcon: 'assets/images/fa-solid_calendar-day.svg',
                        ),
                        SizedBox(height: 24.h,),
                        CustomInput(
                          textInputAction: TextInputAction.done,
                          focusNode: _durationFocus,
                          hintText: '',
                          onChanged: (text) {
                            _addWorkingExperienceCt.form.value.duration = text;
                            _addWorkingExperienceCt.updateForm(_addWorkingExperienceCt.form.value);
                          },
                          inputType: TextInputType.name,
                          onEditingComplete: () => FocusScope.of(context).requestFocus(FocusNode()),
                          onTap: () => setState(() => _durationFocus.requestFocus()),
                          labelText: 'DURATION',
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
