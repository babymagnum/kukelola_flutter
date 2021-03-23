import 'package:get/get.dart';
import 'package:kukelola_flutter/networking/model/workflow_grid.dart';
import 'package:kukelola_flutter/networking/request/workflow_approval_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';
import 'package:kukelola_flutter/view/workflow_approval/controller/workflow_approval_filter_controller.dart';

class CompletedRequestController extends GetxController {
  var loadingRequest = false.obs;
  var errorRequest = false.obs;
  var listCompletedRequest = List<WorkflowGridData>().obs;

  getCompletedRequest() async {
    final _workflowApprovalFilterCt = Get.find<WorkflowApprovalFilterController>();
    final form = _workflowApprovalFilterCt.form.value;

    loadingRequest.value = true;
    final data = await Service().workFlowGrid(WorkflowApprovalRequest(form.keyword, false, int.parse(form.periode.split('/')[0]), form.request.id, form.route.id, int.parse(form.periode.split('/')[1])));
    loadingRequest.value = false;

    if (data?.data != null) {
      errorRequest.value = false;
      listCompletedRequest.clear();
      data.data.forEach((element) => listCompletedRequest.add(element));
    } else {
      errorRequest.value = true;
    }
  }

  getAttachment(int index) async {
    var item = listCompletedRequest[index];
    item.loadingAttachment = true;
    listCompletedRequest[index] = item;
    final data = await Service().fileAttachment(item.attachmentId);
    item.loadingAttachment = false;

    if (data?.data != null) {
      item.errorAttachment = false;
      item.attachmentData = data.data;
    } else {
      item.errorAttachment = true;
    }

    listCompletedRequest[index] = item;
  }

}