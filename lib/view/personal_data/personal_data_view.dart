import 'package:division/division.dart';
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
import 'package:kukelola_flutter/core/widgets/button_reload.dart';
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
  var _firstNameFocus = FocusNode(), _emailFocus = FocusNode(), _middleNameFocus = FocusNode(), _lastNameFocus = FocusNode(),
      _cityOfBirthFocus = FocusNode(), _phoneFocus = FocusNode(),
      _identificationNumberFocus = FocusNode(), _addressFocus = FocusNode();

  _showDropdownType(BuildContext context, GlobalKey key, List<CommonType> list, Function(int item) onSelect) {

    FocusScope.of(context).requestFocus(FocusNode());

    final RenderBox renderBoxRed = key.currentContext.findRenderObject();
    final position = renderBoxRed.localToGlobal(Offset.zero);
    final parentHeight = ((commonController.standartDropdownItemSize.value.height + 5.h) * list.length) + 10.h;

    Get.dialog(Stack(
      children: [
        Container(width: Get.width, height: Get.height,),
        Positioned(
          left: 24.w, right: 24.w,
          top: position.dy > Get.height - parentHeight - context.mediaQueryPadding.top ? Get.height - parentHeight - context.mediaQueryPadding.top : position.dy,
          child: Column(
            children: [
              Parent(
                style: ParentStyle()..width(Get.width)..maxHeight(150.h)..borderRadius(all: 6)
                  ..background.color(Colors.white)..boxShadow(color: Colors.black.withOpacity(0.05), blur: 6, spread: 0, offset: Offset(0, 2)),
                child: CupertinoScrollbar(
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    itemCount: list.length,
                    itemBuilder: (_, index) => ListStandartDropdownItem(
                      content: list[index].label,
                      onClick: () {
                        onSelect(list[index].id);
                        Get.back();
                      },
                    ),
                    separatorBuilder: (_, __) => Divider(color: Colors.transparent, height: 5.h,),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ), barrierColor: Colors.transparent);
  }

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
                minTime: DateTime(1940),
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

    Future.delayed(Duration.zero, () async {
      await _personalDataCt.getStaff();

      setState(() {
        _firstNameCt.text = _personalDataCt.staff.value.firstName;
        _middleNameCt.text = _personalDataCt.staff.value.middleName;
        _lastNameCt.text = _personalDataCt.staff.value.lastName;
        _cityOfBirthCt.text = _personalDataCt.staff.value.cityOfBirth;
        _emailCt.text = _personalDataCt.staff.value.email;
        _phoneCt.text = _personalDataCt.staff.value.phone;
        _identificationNumberCt.text = _personalDataCt.staff.value.identificationNumber;
        _addressCt.text = _personalDataCt.staff.value.mainAddress;
      });
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
                  verticalPadding: 4.h,
                  horizontalPadding: 15.w,
                  loadingSize: 12.w,
                  textStyle: ThemeTextStyle.biryaniSemiBold.apply(color: Colors.white, fontSizeDelta: 12.ssp),
                )
              ],
            ),
            ),
          ),
          Expanded(
            child: Obx(() => _personalDataCt.loadingStaff.value ?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20.w, height: 20.w,
                    child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(ThemeColor.primary),),
                  )
                ],
              ) :
              _personalDataCt.errorStaff.value ?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ButtonReload(onTap: () => _personalDataCt.getStaff(), error: _personalDataCt.errorMessage.value == '' ? null : _personalDataCt.errorMessage.value,),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  )
                ],
              ) :
              CupertinoScrollbar(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        SizedBox(height: 32.h,),
                        CustomInput(
                          textInputAction: TextInputAction.next,
                          focusNode: _firstNameFocus,
                          hintText: 'e.g Arief',
                          controller: _firstNameCt,
                          onChanged: (text) {
                            _personalDataCt.staff.value.firstName = text.trim();
                            _personalDataCt.updateStaff(_personalDataCt.staff.value);
                          },
                          inputType: TextInputType.name,
                          onEditingComplete: () => FocusScope.of(context).requestFocus(FocusNode()),
                          onTap: () => setState(() => _firstNameFocus.requestFocus()),
                          labelText: 'FIRST NAME',
                        ),
                        SizedBox(height: 24.h,),
                        CustomInput(
                          textInputAction: TextInputAction.next,
                          focusNode: _middleNameFocus,
                          hintText: 'e.g Zulfikar',
                          controller: _middleNameCt,
                          onChanged: (text) {
                            _personalDataCt.staff.value.middleName = text.trim();
                            _personalDataCt.updateStaff(_personalDataCt.staff.value);
                          },
                          inputType: TextInputType.name,
                          onEditingComplete: () => FocusScope.of(context).requestFocus(FocusNode()),
                          onTap: () => setState(() => _middleNameFocus.requestFocus()),
                          labelText: 'MIDDLE NAME',
                        ),
                        SizedBox(height: 24.h,),
                        CustomInput(
                          textInputAction: TextInputAction.next,
                          focusNode: _lastNameFocus,
                          hintText: 'e.g Naik',
                          controller: _lastNameCt,
                          onChanged: (text) {
                            _personalDataCt.staff.value.lastName = text.trim();
                            _personalDataCt.updateStaff(_personalDataCt.staff.value);
                          },
                          inputType: TextInputType.name,
                          onEditingComplete: () => FocusScope.of(context).requestFocus(FocusNode()),
                          onTap: () => setState(() => _lastNameFocus.requestFocus()),
                          labelText: 'LAST NAME',
                        ),
                        SizedBox(height: 24.h,),
                        CustomInput(
                          textInputAction: TextInputAction.next,
                          focusNode: _cityOfBirthFocus,
                          hintText: 'e.g Yogyakarta',
                          controller: _cityOfBirthCt,
                          onChanged: (text) {
                            _personalDataCt.staff.value.cityOfBirth = text.trim();
                            _personalDataCt.updateStaff(_personalDataCt.staff.value);
                          },
                          inputType: TextInputType.name,
                          onEditingComplete: () => FocusScope.of(context).requestFocus(FocusNode()),
                          onTap: () => setState(() => _cityOfBirthFocus.requestFocus()),
                          labelText: 'CITY OF BIRTH',
                        ),
                        SizedBox(height: 24.h,),
                        InputTap(
                          labelText: 'DATE OF BIRTH',
                          hintText: '',
                          onTap: () => _showDatePicker(context, _personalDataCt.staff.value.dateOfBirth, (date) {
                            _personalDataCt.staff.value.dateOfBirth = date;
                            _personalDataCt.updateStaff(_personalDataCt.staff.value);
                          }),
                          rightIcon: '',
                          leftSize: Size(14.w, 16.h),
                          value: _personalDataCt.staff.value.dateOfBirth,
                          leftIcon: 'assets/images/fa-solid_calendar-day.svg',
                        ),
                        SizedBox(height: 24.h,),
                        CustomInput(
                          textInputAction: TextInputAction.next,
                          focusNode: _emailFocus,
                          enable: false,
                          hintText: 'e.g ariefz@gmail.com',
                          controller: _emailCt,
                          inputType: TextInputType.emailAddress,
                          onEditingComplete: () => FocusScope.of(context).requestFocus(FocusNode()),
                          onTap: () => setState(() => _emailFocus.requestFocus()),
                          labelText: 'EMAIL',
                        ),
                        SizedBox(height: 24.h,),
                        CustomInput(
                          textInputAction: TextInputAction.next,
                          focusNode: _phoneFocus,
                          hintText: 'e.g 085792810602',
                          inputType: TextInputType.name,
                          onChanged: (text) {
                            _personalDataCt.staff.value.phone = text.trim();
                            _personalDataCt.updateStaff(_personalDataCt.staff.value);
                          },
                          controller: _phoneCt,
                          onEditingComplete: () => FocusScope.of(context).requestFocus(FocusNode()),
                          onTap: () => setState(() => _phoneFocus.requestFocus()),
                          labelText: 'PHONE',
                        ),
                        SizedBox(height: 24.h,),
                        CustomInput(
                          textInputAction: TextInputAction.next,
                          focusNode: _identificationNumberFocus,
                          hintText: 'e.g 347112080819872727',
                          controller: _identificationNumberCt,
                          onChanged: (text) {
                            _personalDataCt.staff.value.identificationNumber = text.trim();
                            _personalDataCt.updateStaff(_personalDataCt.staff.value);
                          },
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
                            _personalDataCt.staff.value.gender = item;
                            _personalDataCt.updateStaff(_personalDataCt.staff.value);
                          }),
                          rightIcon: 'assets/images/fa-solid_caret-down.svg',
                          rightSize: Size(10.w, 16.h),
                          value: _personalDataCt.listGender.any((element) => element.id == _personalDataCt.staff.value.gender) ?
                          _personalDataCt.listGender.firstWhere((element) => element.id == _personalDataCt.staff.value.gender).label :
                          '-',
                        ),
                        SizedBox(height: 24.h,),
                        InputTap(
                          key: _religionKey,
                          labelText: 'RELIGION',
                          hintText: 'choose religion...',
                          onTap: () => _showDropdownType(context, _religionKey, _personalDataCt.listReligion, (item) {
                            _personalDataCt.staff.value.religion = item;
                            _personalDataCt.updateStaff(_personalDataCt.staff.value);
                          }),
                          rightIcon: 'assets/images/fa-solid_caret-down.svg',
                          rightSize: Size(10.w, 16.h),
                          value: _personalDataCt.listReligion.any((element) => element.id == _personalDataCt.staff.value.religion) ?
                          _personalDataCt.listReligion.firstWhere((element) => element.id == _personalDataCt.staff.value.religion).label :
                          '-',
                        ),
                        SizedBox(height: 24.h,),
                        InputTap(
                          key: _maritalStatusKey,
                          labelText: 'MARITAL STATUS',
                          hintText: 'choose marital...',
                          onTap: () => _showDropdownType(context, _maritalStatusKey, _personalDataCt.listMarital, (item) {
                            _personalDataCt.staff.value.maritalStatus = item;
                            _personalDataCt.updateStaff(_personalDataCt.staff.value);
                          }),
                          rightIcon: 'assets/images/fa-solid_caret-down.svg',
                          rightSize: Size(10.w, 16.h),
                          value: _personalDataCt.listMarital.any((element) => element.id == _personalDataCt.staff.value.maritalStatus) ?
                          _personalDataCt.listMarital.firstWhere((element) => element.id == _personalDataCt.staff.value.maritalStatus).label :
                          '-',
                        ),
                        SizedBox(height: 24.h,),
                        CustomInput(
                          textInputAction: TextInputAction.newline,
                          focusNode: _addressFocus,
                          hintText: 'e.g Jl. Kolonel Sugiono Yogyakarta',
                          maxLines: null,
                          onChanged: (text) {
                            _personalDataCt.staff.value.mainAddress = text.trim();
                            _personalDataCt.updateStaff(_personalDataCt.staff.value);
                          },
                          inputType: TextInputType.multiline,
                          onEditingComplete: () {},
                          controller: _addressCt,
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
