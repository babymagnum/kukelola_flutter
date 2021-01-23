import 'package:get/get.dart';
import 'package:kukelola_flutter/view/leave_summary/leave_summary_controller.dart';
import 'package:kukelola_flutter/view/overtime_summary/overtime_summary_controller.dart';

class OvertimeSummaryDetailController extends GetxController {
  var _overtimeSummaryCt = Get.find<OvertimeSummaryController>();

  var loadingCancel = false.obs;

  cancelLeave(int index) async {
    loadingCancel.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loadingCancel.value = false;

    _overtimeSummaryCt.changeStatusToCanceled(index);
  }
}