import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/view/reimbursment_summary/reimbursment_summary_controller.dart';

class ReimbursmentSummaryFilterController extends GetxController {
  var startDate = ''.obs;
  var endDate = ''.obs;
  var _reimbursmentSummaryCt = Get.find<ReimbursmentSummaryController>();

  setStartDate(String value) => startDate.value = value;
  setEndDate(String value) => endDate.value = value;

  filter() {
    if (startDate.value == '' || endDate.value == '') {
      CommonFunction.standartSnackbar('Anda belum mengisi field start date dan end date');
      return;
    }

    Get.back();

    _reimbursmentSummaryCt.populateData();
  }

  reset() {
    setStartDate('');
    setEndDate('');

    Get.back();

    _reimbursmentSummaryCt.populateData();
  }
}