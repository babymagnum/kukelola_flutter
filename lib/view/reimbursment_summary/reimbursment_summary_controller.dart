import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/model/file_attachment.dart';
import 'package:kukelola_flutter/networking/model/reimbursment_summary_grid.dart';
import 'package:kukelola_flutter/networking/request/summary_grid_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';
import 'package:kukelola_flutter/view/reimbursment_summary/widget/reimbursment_summary_filter_controller.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart' as syspaths;

class ReimbursmentSummaryController extends GetxController {
  var loadingSummary = false.obs;
  var errorSummary = false.obs;
  var listSummary = List<ReimbursmentSummaryGridData>().obs;
  var loadingAttachment = false.obs;
  var errorAttachment = false.obs;
  var attachmentData = FileAttachmentData().obs;

  setAttachmentData(FileAttachmentData value) => attachmentData.value = value;

  populateData() async {
    final reimbursmentSummaryFilterCt = Get.find<ReimbursmentSummaryFilterController>();

    loadingSummary.value = true;
    final data = await Service().reimbursmentSummaryGrid(SummaryGridRequest(homeController.userData.value.userId, reimbursmentSummaryFilterCt.startDate.value, reimbursmentSummaryFilterCt.endDate.value));
    loadingSummary.value = false;

    if (data?.data != null) {
      errorSummary.value = false;
      listSummary.clear();
      listSummary.addAll(data.data);
    } else {
      errorSummary.value = true;
    }
  }

  getAttachment(String attachmentId) async {
    loadingAttachment.value = true;
    final data = await Service().fileAttachment(attachmentId);
    loadingAttachment.value = false;

    if (data?.data != null) {
      errorAttachment.value = false;
      attachmentData.value = data.data;
    } else {
      errorAttachment.value = true;
    }
  }
}