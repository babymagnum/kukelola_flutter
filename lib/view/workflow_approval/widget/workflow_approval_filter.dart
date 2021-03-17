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
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/core/widgets/custom_date_picker.dart';
import 'package:kukelola_flutter/core/widgets/custom_input.dart';
import 'package:kukelola_flutter/core/widgets/input_tap.dart';
import 'package:kukelola_flutter/core/widgets/list_standart_dropdown_item.dart';
import 'package:kukelola_flutter/view/workflow_approval/controller/workflow_approval_filter_controller.dart';

import '../../../main.dart';

class WorkflowApprovalFilter extends StatefulWidget {
  @override
  _WorkflowApprovalFilterState createState() => _WorkflowApprovalFilterState();
}

class _WorkflowApprovalFilterState extends State<WorkflowApprovalFilter> {

  var _workflowApprovalFilterCt = Get.find<WorkflowApprovalFilterController>();
  var _routeKey = GlobalKey(), _requestKey = GlobalKey(), _statusKey = GlobalKey();
  var _keywordFocus = FocusNode();

  _showDatePicker(BuildContext context, String selectedDate, Function (String date) onPick) {

    FocusScope.of(context).requestFocus(FocusNode());

    var temporaryDate = selectedDate == '' ? TextUtil.getCurrentDate('MM/yyyy') : selectedDate;

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return DateTimePickerComponent(
            onPick: () {
              onPick(temporaryDate);
              Navigator.pop(context);
            },
            pickerType: DateTimePickerType.monthYear,
            onChanged: (DateTime date) => temporaryDate = TextUtil.dateTimeToString(date, 'MM/yyyy'),
            pickerModel: CustomDatePicker(
                currentTime: TextUtil.convertStringToDateTime(selectedDate, 'MM/yyyy'),
                minTime: DateTime(DateTime.now().year - 1),
                maxTime: DateTime(DateTime.now().year + 20, 12, 31),
                locale: commonController.language.value == Constant.INDONESIAN ? LocaleType.id : LocaleType.en
            ),
          );
        }
    );
  }

  _showDropdownType(BuildContext context, GlobalKey key, List<CommonType> list, Function(CommonType item) onSelect) {

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

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: ParentStyle()..background.color(Colors.white)..borderRadius(all: 6),
      child: CupertinoScrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 24.h,),
                  CustomInput(
                    textInputAction: TextInputAction.next,
                    focusNode: _keywordFocus,
                    hintText: 'type something...',
                    labelText: 'Keyword',
                    inputType: TextInputType.emailAddress,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(_keywordFocus);
                    },
                    onChanged: (text) {
                      _workflowApprovalFilterCt.form.value.keyword = text.trim();
                      _workflowApprovalFilterCt.setForm(_workflowApprovalFilterCt.form.value);
                    },
                    onTap: () => setState(() => _keywordFocus.requestFocus()),
                  ),
                  SizedBox(height: 16.h,),
                  InputTap(
                    labelText: 'Periode',
                    hintText: '',
                    onTap: () => _showDatePicker(context, _workflowApprovalFilterCt.form.value.periode, (date) {
                      _workflowApprovalFilterCt.form.value.periode = date;
                      _workflowApprovalFilterCt.setForm(_workflowApprovalFilterCt.form.value);
                    }),
                    rightIcon: '',
                    leftSize: Size(14.w, 16.h),
                    value: _workflowApprovalFilterCt.form.value.periode,
                    leftIcon: 'assets/images/fa-solid_calendar-day.svg',
                  ),
                  SizedBox(height: 16.h,),
                  InputTap(
                    key: _routeKey,
                    labelText: 'Route',
                    hintText: 'choose leave type...',
                    onTap: () => _showDropdownType(context, _routeKey, _workflowApprovalFilterCt.listRoute, (type) {
                      _workflowApprovalFilterCt.form.value.route = type;
                      _workflowApprovalFilterCt.setForm(_workflowApprovalFilterCt.form.value);
                    }),
                    rightIcon: 'assets/images/fa-solid_caret-down.svg',
                    rightSize: Size(10.w, 16.h),
                    value: _workflowApprovalFilterCt.form.value.route.label,
                  ),
                  SizedBox(height: 16.h,),
                  InputTap(
                    key: _requestKey,
                    labelText: 'Request',
                    hintText: 'choose leave type...',
                    onTap: () => _showDropdownType(context, _routeKey, _workflowApprovalFilterCt.listRequest, (type) {
                      _workflowApprovalFilterCt.form.value.request = type;
                      _workflowApprovalFilterCt.setForm(_workflowApprovalFilterCt.form.value);
                    }),
                    rightIcon: 'assets/images/fa-solid_caret-down.svg',
                    rightSize: Size(10.w, 16.h),
                    value: _workflowApprovalFilterCt.form.value.request.label,
                  ),
                  SizedBox(height: 24.h,),
                  ButtonLoading(
                    backgroundColor: ThemeColor.secondary,
                    disable: false,
                    title: 'Filter',
                    loading: false,
                    onTap: () => _workflowApprovalFilterCt.filter(),
                    textStyle: ThemeTextStyle.biryaniSemiBold.apply(fontSizeDelta: 10.ssp, color: Colors.white),
                  ),
                  SizedBox(height: 24.h,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
