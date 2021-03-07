import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/networking/model/workflow_grid.dart';
import 'package:kukelola_flutter/networking/request/reject_request.dart';
import 'package:kukelola_flutter/networking/request/workflow_approval_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';

class OngoingRequestController extends GetxController {
  var rejectReason = ''.obs;
  var loadingRequest = false.obs;
  var errorRequest = false.obs;
  var loadingReject = false.obs;
  var listOngoingRequest = List<WorkflowGridData>().obs;

  setRejectReason(String value) => rejectReason.value = value;

  getOngoingRequest(WorkflowApprovalFilterForm form) async {
    loadingRequest.value = true;
    final data = await Service().workFlowGrid(WorkflowApprovalRequest(form.keyword, true, int.parse(form.periode.split('/')[0]), form.request.id, form.route.id, int.parse(form.periode.split('/')[1])));
    loadingRequest.value = false;

    if (data?.data != null) {
      errorRequest.value = false;
      listOngoingRequest.clear();
      data.data.forEach((element) => listOngoingRequest.add(element));
    } else {
      errorRequest.value = true;
    }
  }

  cancelRequest(int index) async {
    var item = listOngoingRequest[index];
    item.loadingCancel = true;
    listOngoingRequest[index] = item;
    final data = await Service().cancelRequest(item.id);
    item.loadingCancel = false;

    if (data?.isSuccess ?? false) {
      item.workflowStatus = 3;
      CommonFunction.standartSnackbar('Request cancelled succesfully');
    } else {
      CommonFunction.standartSnackbar('Request cancelled fail');
    }

    listOngoingRequest[index] = item;
  }

  approveRequest(int index) async {
    var item = listOngoingRequest[index];
    item.loadingApprove = true;
    listOngoingRequest[index] = item;
    final data = await Service().approveRequest(item.id);
    item.loadingApprove = false;

    if (data?.isSuccess ?? false) {
      item.workflowStatus = 1;
      CommonFunction.standartSnackbar('Request approved succesfully');
    } else {
      CommonFunction.standartSnackbar('Request approved fail');
    }

    listOngoingRequest[index] = item;
  }

  rejectRequest(int index) async {
    var item = listOngoingRequest[index];
    item.loadingReject = true;
    listOngoingRequest[index] = item;
    final data = await Service().rejectRequest(RejectRequest(item.id, rejectReason.value));
    item.loadingReject = false;

    if (data?.isSuccess ?? false) {
      item.workflowStatus = 2;
      CommonFunction.standartSnackbar('Request rejected succesfully');
    } else {
      CommonFunction.standartSnackbar('Request rejected fail');
    }

    listOngoingRequest[index] = item;
  }

  changeStatus(int index, int status) {
    var data = listOngoingRequest[index];
    data.workflowStatus = status;
    listOngoingRequest[index] = data;
  }

}