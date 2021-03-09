import 'dart:io';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/model/leave_summary_grid.dart';
import 'package:kukelola_flutter/networking/request/summary_grid_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';
import 'package:kukelola_flutter/view/leave_summary/view/leave_summary_filter_controller.dart';
import 'package:kukelola_flutter/view/workflow_approval/controller/ongoing_request_controller.dart';
import 'package:kukelola_flutter/view/workflow_approval/controller/workflow_approval_controller.dart';

class LeaveSummaryController extends GetxController {
  var loadingSummary = false.obs;
  var errorSummary = false.obs;
  var listSummary = List<LeaveSummaryGridData>().obs;

  populateData() async {
    final leaveSummaryFilterCt = Get.find<LeaveSummaryFilterController>();

    loadingSummary.value = true;
    final data = await Service().leaveSummaryGrid(SummaryGridRequest(homeController.userData.value.id, leaveSummaryFilterCt.startDate.value, leaveSummaryFilterCt.endDate.value));
    loadingSummary.value = false;

    if (data?.data != null) {
      errorSummary.value = false;
      listSummary.clear();
      listSummary.addAll(data.data);
    } else {
      errorSummary.value = true;
    }
  }
}