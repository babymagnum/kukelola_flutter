import 'dart:io';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/model/overtime_summary_grid.dart';
import 'package:kukelola_flutter/networking/request/summary_grid_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';
import 'package:kukelola_flutter/view/overtime_summary/view/overtime_summary_filter_controller.dart';

class OvertimeSummaryController extends GetxController {
  var loadingSummary = false.obs;
  var errorSummary = false.obs;
  var listSummary = List<OvertimeSummaryGridData>().obs;

  populateData() async {
    final overtimeSummaryFilterCt = Get.find<OvertimeSummaryFilterController>();

    loadingSummary.value = true;
    final data = await Service().overtimeSummaryGrid(SummaryGridRequest(homeController.userData.value.id, overtimeSummaryFilterCt.startDate.value, overtimeSummaryFilterCt.endDate.value));
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