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
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/core/widgets/custom_date_picker.dart';
import 'package:kukelola_flutter/core/widgets/custom_input.dart';
import 'package:kukelola_flutter/core/widgets/input_tap.dart';
import 'package:kukelola_flutter/networking/model/staff_experience.dart';
import 'package:kukelola_flutter/view/add_family/add_family_controller.dart';
import 'package:kukelola_flutter/view/add_working_experience/add_working_experience_controller.dart';
import 'package:kukelola_flutter/view/base_view.dart';

import '../../main.dart';

class AddWorkingExperienceView extends StatefulWidget {

  final StaffExperienceData item;
  final int index;

  AddWorkingExperienceView({@required this.item, @required this.index});

  @override
  _AddWorkingExperienceViewState createState() => _AddWorkingExperienceViewState();
}

class _AddWorkingExperienceViewState extends State<AddWorkingExperienceView> {

  var _addWorkingExperienceCt = Get.put(AddWorkingExperienceController());
  var _lastPositionFocus = FocusNode(), _companyFocus = FocusNode(), _locationFocus = FocusNode(),
      _durationFocus = FocusNode();
  var _lastPositionCt = TextEditingController(), _companyCt = TextEditingController(), _locationCt = TextEditingController(),
      _durationCt = TextEditingController();

  _showDatePicker(BuildContext context, String selectedDate, Function (String date) onPick) {

    FocusScope.of(context).requestFocus(FocusNode());

    var temporaryDate = selectedDate == '' ? TextUtil.getCurrentDate('yyyy') : selectedDate;

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return DateTimePickerComponent(
            onPick: () {
              onPick(temporaryDate);
              Navigator.pop(context);
            },
            pickerType: DateTimePickerType.year,
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
  void initState() {
    super.initState();

    if (widget.item != null) {
      _addWorkingExperienceCt.updateForm(WorkingExperienceItem.updateData(widget.item.lastPosition, widget.item.company, widget.item.location, widget.item.endYear, widget.item.duration));

      _lastPositionCt.text = widget.item.lastPosition;
      _companyCt.text = widget.item.company;
      _locationCt.text = widget.item.location;
      _durationCt.text = widget.item.duration;
      setState(() {});
    }
  }

  @override
  void dispose() {
    _lastPositionCt.dispose();
    _companyCt.dispose();
    _locationCt.dispose();
    _durationCt.dispose();

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
                    label: 'Add Working Experience',
                    onBack: () => Get.back(),
                  ),
                ),
                SizedBox(width: 10.w,),
                ButtonLoading(
                  backgroundColor: ThemeColor.primary,
                  disable: _addWorkingExperienceCt.loadingSubmit.value || _disable(),
                  title: widget.item == null ? 'Save' : 'Update',
                  loading: _addWorkingExperienceCt.loadingSubmit.value,
                  onTap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    setState(() {});

                    if (widget.item == null) {
                      await _addWorkingExperienceCt.submitExperience();

                      if (_addWorkingExperienceCt.form.value.lastPosition == '') {
                        _lastPositionCt.text = '';
                        _companyCt.text = '';
                        _locationCt.text = '';
                        _durationCt.text = '';
                        setState(() {});
                      }
                    } else {
                      _addWorkingExperienceCt.updateExperience(widget.item.id, widget.index);
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
                child: Obx(() => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                      children: [
                        SizedBox(height: 32.h,),
                        CustomInput(
                          textInputAction: TextInputAction.next,
                          focusNode: _lastPositionFocus,
                          controller: _lastPositionCt,
                          hintText: 'e.g Programmer',
                          onChanged: (text) {
                            _addWorkingExperienceCt.form.value.lastPosition = text;
                            _addWorkingExperienceCt.updateForm(_addWorkingExperienceCt.form.value);
                            setState(() {});
                          },
                          inputType: TextInputType.text,
                          onEditingComplete: () => setState(() => _companyFocus.requestFocus()),
                          onTap: () => setState(() => _lastPositionFocus.requestFocus()),
                          labelText: 'LAST POSITION',
                        ),
                        SizedBox(height: 24.h,),
                        CustomInput(
                          textInputAction: TextInputAction.next,
                          focusNode: _companyFocus,
                          controller: _companyCt,
                          hintText: 'e.g Tokopedia',
                          onChanged: (text) {
                            _addWorkingExperienceCt.form.value.company = text;
                            _addWorkingExperienceCt.updateForm(_addWorkingExperienceCt.form.value);
                            setState(() {});
                          },
                          inputType: TextInputType.text,
                          onEditingComplete: () => setState(() => _locationFocus.requestFocus()),
                          onTap: () => setState(() => _companyFocus.requestFocus()),
                          labelText: 'COMPANY',
                        ),
                        SizedBox(height: 24.h,),
                        CustomInput(
                          textInputAction: TextInputAction.done,
                          focusNode: _locationFocus,
                          controller: _locationCt,
                          hintText: 'e.g Jakarta',
                          onChanged: (text) {
                            _addWorkingExperienceCt.form.value.location = text;
                            _addWorkingExperienceCt.updateForm(_addWorkingExperienceCt.form.value);
                            setState(() {});
                          },
                          inputType: TextInputType.text,
                          onEditingComplete: () => FocusScope.of(context).requestFocus(FocusNode()),
                          onTap: () => setState(() => _locationFocus.requestFocus()),
                          labelText: 'LOCATION',
                        ),
                        SizedBox(height: 24.h,),
                        InputTap(
                          labelText: 'END YEAR',
                          hintText: 'e.g ${TextUtil.getCurrentDate('yyyy')}',
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
                          controller: _durationCt,
                          hintText: 'e.g 2 years',
                          onChanged: (text) {
                            _addWorkingExperienceCt.form.value.duration = text;
                            _addWorkingExperienceCt.updateForm(_addWorkingExperienceCt.form.value);
                            setState(() {});
                          },
                          inputType: TextInputType.text,
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
