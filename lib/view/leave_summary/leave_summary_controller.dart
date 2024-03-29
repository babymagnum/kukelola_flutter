import 'package:get/get.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/model/file_attachment.dart';
import 'package:kukelola_flutter/networking/model/leave_summary_grid.dart';
import 'package:kukelola_flutter/networking/request/summary_grid_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';
import 'package:kukelola_flutter/view/leave_summary/view/leave_summary_filter_controller.dart';

class LeaveSummaryController extends GetxController {
  var loadingSummary = false.obs;
  var errorSummary = false.obs;
  var listSummary = List<LeaveSummaryGridData>().obs;
  var loadingAttachment = false.obs;
  var errorAttachment = false.obs;
  var attachmentData = FileAttachmentData().obs;

  setAttachmentData(FileAttachmentData value) => attachmentData.value = value;

  populateData() async {
    final leaveSummaryFilterCt = Get.find<LeaveSummaryFilterController>();

    loadingSummary.value = true;
    final data = await Service().leaveSummaryGrid(SummaryGridRequest(homeController.userData.value.userId, leaveSummaryFilterCt.startDate.value, leaveSummaryFilterCt.endDate.value));
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