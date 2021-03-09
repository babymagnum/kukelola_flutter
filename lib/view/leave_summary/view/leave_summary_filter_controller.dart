import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/view/leave_summary/leave_summary_controller.dart';

class LeaveSummaryFilterController extends GetxController {
  var startDate = ''.obs;
  var endDate = ''.obs;
  var _leaveSummaryCt = Get.find<LeaveSummaryController>();

  setStartDate(String value) => startDate.value = value;
  setEndDate(String value) => endDate.value = value;

  filter() {
    if (startDate.value == '' || endDate.value == '') {
      CommonFunction.standartSnackbar('Anda belum mengisi field start date dan end date');
      return;
    }

    Get.back();

    _leaveSummaryCt.populateData();
  }

  reset() {
    setStartDate('');
    setEndDate('');

    Get.back();

    _leaveSummaryCt.populateData();
  }
}