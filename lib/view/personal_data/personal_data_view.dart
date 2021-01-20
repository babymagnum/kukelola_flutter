import 'package:division/division.dart';
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
import 'package:kukelola_flutter/core/widgets/list_standart_dropdown_item.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:kukelola_flutter/view/personal_data/personal_data_controller.dart';

class PersonalDataView extends StatefulWidget {
  @override
  _PersonalDataViewState createState() => _PersonalDataViewState();
}

class _PersonalDataViewState extends State<PersonalDataView> {

  var _personalDataCt = Get.put(PersonalDataController());
  var _genderKey = GlobalKey(), _religionKey = GlobalKey(), _maritalStatusKey = GlobalKey();
  var _firstNameCt = TextEditingController(), _middleNameCt = TextEditingController(), _lastNameCt = TextEditingController(),
      _cityOfBirthCt = TextEditingController(), _emailCt = TextEditingController(), _phoneCt = TextEditingController(),
      _identificationNumberCt = TextEditingController(), _addressCt = TextEditingController();
  var _firstNameFocus = FocusNode(), _middleNameFocus = FocusNode(), _lastNameFocus = FocusNode(),
      _cityOfBirthFocus = FocusNode(), _emailFocus = FocusNode(), _phoneFocus = FocusNode(),
      _identificationNumberFocus = FocusNode(), _addressFocus = FocusNode();

  _showDropdownType(BuildContext context, GlobalKey key, List<String> list, Function(String item) onSelect) {

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
                      content: list[index],
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

  @override
  void dispose() {
    _firstNameCt.dispose();
    _middleNameCt.dispose();
    _lastNameCt.dispose();
    _cityOfBirthCt.dispose();
    _emailCt.dispose();
    _phoneCt.dispose();
    _identificationNumberCt.dispose();
    _addressCt.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _firstNameCt.text = _personalDataCt.form.value.firstName;
    _middleNameCt.text = _personalDataCt.form.value.middleName;
    _lastNameCt.text = _personalDataCt.form.value.lastName;
    _cityOfBirthCt.text = _personalDataCt.form.value.cityOfBirth;
    _emailCt.text = _personalDataCt.form.value.email;
    _phoneCt.text = _personalDataCt.form.value.phone;
    _identificationNumberCt.text = _personalDataCt.form.value.identificationNumber;
    _addressCt.text = _personalDataCt.form.value.address;
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
                    label: 'Edit personal Data',
                    onBack: () => Get.back(),
                  ),
                ),
                SizedBox(width: 10.w,),
                ButtonLoading(
                  backgroundColor: ThemeColor.primary,
                  disable: _personalDataCt.loadingSave.value,
                  title: 'Save',
                  loading: _personalDataCt.loadingSave.value,
                  onTap: () => _personalDataCt.saveChange(),
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
                          focusNode: _firstNameFocus,
                          hintText: '',
                          inputType: TextInputType.name,
                          onEditingComplete: () => setState(() => _middleNameFocus.requestFocus()),
                          onTap: () => setState(() => _firstNameFocus.requestFocus()),
                          labelText: 'FIRST NAME',
                        ),
                        SizedBox(height: 24.h,),
                        CustomInput(
                          textInputAction: TextInputAction.next,
                          focusNode: _middleNameFocus,
                          hintText: '',
                          inputType: TextInputType.name,
                          onEditingComplete: () => setState(() => _lastNameFocus.requestFocus()),
                          onTap: () => setState(() => _middleNameFocus.requestFocus()),
                          labelText: 'MIDDLE NAME',
                        ),
                        SizedBox(height: 24.h,),
                        CustomInput(
                          textInputAction: TextInputAction.next,
                          focusNode: _lastNameFocus,
                          hintText: '',
                          inputType: TextInputType.name,
                          onEditingComplete: () => setState(() => _cityOfBirthFocus.requestFocus()),
                          onTap: () => setState(() => _lastNameFocus.requestFocus()),
                          labelText: 'LAST NAME',
                        ),
                        SizedBox(height: 24.h,),
                        CustomInput(
                          textInputAction: TextInputAction.next,
                          focusNode: _cityOfBirthFocus,
                          hintText: '',
                          inputType: TextInputType.name,
                          onEditingComplete: () => setState(() => _middleNameFocus.requestFocus()),
                          onTap: () => setState(() => _firstNameFocus.requestFocus()),
                          labelText: 'CITY OF BIRTH',
                        ),
                        SizedBox(height: 24.h,),
                        InputTap(
                          labelText: 'DATE OF BIRTH',
                          hintText: '',
                          onTap: () => _showDatePicker(context, _personalDataCt.form.value.dateOfBirth, (date) {
                            _personalDataCt.form.value.dateOfBirth = date;
                            _personalDataCt.updateForm(_personalDataCt.form.value);
                          }),
                          rightIcon: '',
                          leftSize: Size(14.w, 16.h),
                          value: _personalDataCt.form.value.dateOfBirth,
                          leftIcon: 'assets/images/fa-solid_calendar-day.svg',
                        ),
                        SizedBox(height: 24.h,),
                        CustomInput(
                          textInputAction: TextInputAction.next,
                          focusNode: _emailFocus,
                          hintText: '',
                          inputType: TextInputType.name,
                          onEditingComplete: () => setState(() => _phoneFocus.requestFocus()),
                          onTap: () => setState(() => _phoneFocus.requestFocus()),
                          labelText: 'PHONE',
                        ),
                        SizedBox(height: 24.h,),
                        CustomInput(
                          textInputAction: TextInputAction.next,
                          focusNode: _identificationNumberFocus,
                          hintText: '',
                          inputType: TextInputType.name,
                          onEditingComplete: () => FocusScope.of(context).requestFocus(FocusNode()),
                          onTap: () => setState(() => _identificationNumberFocus.requestFocus()),
                          labelText: 'IDENTIFICATION NUMBER',
                        ),
                        SizedBox(height: 24.h,),
                        InputTap(
                          key: _genderKey,
                          labelText: 'GENDER',
                          hintText: 'choose gender...',
                          onTap: () => _showDropdownType(context, _genderKey, _personalDataCt.listGender, (item) {
                            _personalDataCt.form.value.gender = item;
                            _personalDataCt.updateForm(_personalDataCt.form.value);
                          }),
                          rightIcon: 'assets/images/fa-solid_caret-down.svg',
                          rightSize: Size(10.w, 16.h),
                          value: _personalDataCt.form.value.gender,
                        ),
                        SizedBox(height: 24.h,),
                        InputTap(
                          key: _religionKey,
                          labelText: 'RELIGION',
                          hintText: 'choose religion...',
                          onTap: () => _showDropdownType(context, _religionKey, _personalDataCt.listReligion, (item) {
                            _personalDataCt.form.value.religion = item;
                            _personalDataCt.updateForm(_personalDataCt.form.value);
                          }),
                          rightIcon: 'assets/images/fa-solid_caret-down.svg',
                          rightSize: Size(10.w, 16.h),
                          value: _personalDataCt.form.value.religion,
                        ),
                        SizedBox(height: 24.h,),
                        InputTap(
                          key: _maritalStatusKey,
                          labelText: 'MARITAL STATUS',
                          hintText: 'choose marital...',
                          onTap: () => _showDropdownType(context, _maritalStatusKey, _personalDataCt.listMarital, (item) {
                            _personalDataCt.form.value.maritalStatus = item;
                            _personalDataCt.updateForm(_personalDataCt.form.value);
                          }),
                          rightIcon: 'assets/images/fa-solid_caret-down.svg',
                          rightSize: Size(10.w, 16.h),
                          value: _personalDataCt.form.value.maritalStatus,
                        ),
                        SizedBox(height: 24.h,),
                        CustomInput(
                          textInputAction: TextInputAction.next,
                          focusNode: _addressFocus,
                          hintText: '',
                          maxLines: null,
                          inputType: TextInputType.multiline,
                          onEditingComplete: () {},
                          onTap: () => setState(() => _addressFocus.requestFocus()),
                          labelText: 'MAIN ADDRESS',
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
