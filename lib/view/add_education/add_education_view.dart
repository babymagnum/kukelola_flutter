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
import 'package:kukelola_flutter/view/add_education/add_education_controller.dart';
import 'package:kukelola_flutter/view/base_view.dart';

import '../../main.dart';

class AddEducationView extends StatefulWidget {
  @override
  _AddEducationViewState createState() => _AddEducationViewState();
}

class _AddEducationViewState extends State<AddEducationView> {

  var _addEducationCt = Get.put(AddEducationController());
  var _degreeKey = GlobalKey();

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
                minTime: DateTime.now(),
                maxTime: DateTime(DateTime.now().year + 20, 12, 31),
                locale: commonController.language.value == Constant.INDONESIAN ? LocaleType.id : LocaleType.en
            ),
          );
        }
    );
  }

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
                    label: 'Add Education',
                    onBack: () => Get.back(),
                  ),
                ),
                SizedBox(width: 10.w,),
                ButtonLoading(
                  backgroundColor: ThemeColor.primary,
                  disable: _addEducationCt.loadingSubmit.value,
                  title: 'Submit',
                  loading: _addEducationCt.loadingSubmit.value,
                  onTap: () => _addEducationCt.submitEducation(),
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
                        InputTap(
                          labelText: 'DEGREE',
                          hintText: 'tap to fill degree',
                          onTap: () => _showDatePicker(context, _addEducationCt.form.value.degree, (date) => null),
                          value: _addEducationCt.form.value.degree,
                          rightIcon: 'assets/images/fa-solid_caret-down.svg',
                          rightSize: Size(10.w, 16.h),
                        ),
                        SizedBox(height: 24.h,),
                        InputTap(
                          labelText: 'START YEAR',
                          hintText: '',
                          onTap: () => _showDatePicker(context, _addEducationCt.form.value.startYear, (date) {
                            _addEducationCt.form.value.startYear = date;
                            _addEducationCt.updateForm(_addEducationCt.form.value);
                          }),
                          rightIcon: '',
                          leftSize: Size(14.w, 16.h),
                          value: _addEducationCt.form.value.startYear,
                          leftIcon: 'assets/images/fa-solid_calendar-day.svg',
                        ),
                        SizedBox(height: 24.h,),
                        InputTap(
                          labelText: 'END YEAR',
                          hintText: '',
                          onTap: () => _showDatePicker(context, _addEducationCt.form.value.endYear, (date) {
                            _addEducationCt.form.value.endYear = date;
                            _addEducationCt.updateForm(_addEducationCt.form.value);
                          }),
                          rightIcon: '',
                          leftSize: Size(14.w, 16.h),
                          value: _addEducationCt.form.value.startYear,
                          leftIcon: 'assets/images/fa-solid_calendar-day.svg',
                        ),
                        SizedBox(height: 24.h,),
                        CustomInput(
                          textInputAction: TextInputAction.next,
                          focusNode: null,
                          hintText: null,
                          inputType: null,
                          onEditingComplete: null,
                          onTap: null,
                          labelText: null,
                        )
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
