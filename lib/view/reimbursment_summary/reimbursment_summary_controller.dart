import 'dart:io';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/model/reimbursment_summary_grid.dart';
import 'package:kukelola_flutter/networking/request/summary_grid_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';
import 'package:kukelola_flutter/view/reimbursment_summary/widget/reimbursment_summary_filter_controller.dart';

class ReimbursmentSummaryController extends GetxController {
  var loadingSummary = false.obs;
  var errorSummary = false.obs;
  var listSummary = List<ReimbursmentSummaryGridData>().obs;

  populateData() async {
    final reimbursmentSummaryFilterCt = Get.find<ReimbursmentSummaryFilterController>();

    loadingSummary.value = true;
    final data = await Service().reimbursmentSummaryGrid(SummaryGridRequest(homeController.userData.value.id, reimbursmentSummaryFilterCt.startDate.value, reimbursmentSummaryFilterCt.endDate.value));
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