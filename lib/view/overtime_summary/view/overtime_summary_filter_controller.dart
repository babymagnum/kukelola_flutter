import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/view/overtime_summary/overtime_summary_controller.dart';

class OvertimeSummaryFilterController extends GetxController {
  var startDate = ''.obs;
  var endDate = ''.obs;
  var _overtimeSummaryCt = Get.find<OvertimeSummaryController>();

  setStartDate(String value) => startDate.value = value;
  setEndDate(String value) => endDate.value = value;

  filter() {
    if (startDate.value == '' || endDate.value == '') {
      CommonFunction.standartSnackbar('Anda belum mengisi field start date dan end date');
      return;
    }

    Get.back();

    _overtimeSummaryCt.populateData();
  }

  reset() {
    setStartDate('');
    setEndDate('');

    Get.back();

    _overtimeSummaryCt.populateData();
  }
}