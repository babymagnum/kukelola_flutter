import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/networking/model/workflow_grid.dart';
import 'package:kukelola_flutter/networking/request/workflow_approval_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';

class CompletedRequestController extends GetxController {
  var loadingRequest = false.obs;
  var errorRequest = false.obs;
  var listCompletedRequest = List<WorkflowGridData>().obs;

  getCompletedRequest(WorkflowApprovalFilterForm form) async {
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

}