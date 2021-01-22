import 'package:get/get.dart';
import 'package:kukelola_flutter/view/leave_summary/leave_summary_controller.dart';

class LeaveSummaryDetailController extends GetxController {
  var _leaveSummaryCt = Get.find<LeaveSummaryController>();

  var loadingCancel = false.obs;

  cancelLeave(int index) async {
    loadingCancel.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loadingCancel.value = false;

    _leaveSummaryCt.changeStatusToCanceled(index);
  }
}