import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/networking/model/workflow_grid.dart';
import 'package:kukelola_flutter/networking/request/reject_request.dart';
import 'package:kukelola_flutter/networking/request/workflow_approval_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';
import 'package:kukelola_flutter/view/workflow_approval/controller/completed_request_controller.dart';
import 'package:kukelola_flutter/view/workflow_approval/controller/workflow_approval_filter_controller.dart';

class OngoingRequestController extends GetxController {
  var rejectReason = ''.obs;
  var loadingRequest = false.obs;
  var errorRequest = false.obs;
  var loadingReject = false.obs;
  var listOngoingRequest = <WorkflowGridData>[].obs;

  setRejectReason(String value) => rejectReason.value = value;

  getAttachment(int index) async {
    var item = listOngoingRequest[index];
    item.loadingAttachment = true;
    listOngoingRequest[index] = item;
    final data = await Service().fileAttachment(item.attachmentId);
    item.loadingAttachment = false;

    if (data?.data != null) {
      item.errorAttachment = false;
      item.attachmentData = data.data;
    } else {
      item.errorAttachment = true;
    }

    listOngoingRequest[index] = item;
  }

  getOngoingRequest() async {
    final _workflowApprovalFilterCt = Get.find<WorkflowApprovalFilterController>();
    final form = _workflowApprovalFilterCt.form.value;

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
    final _completedRequestCt = Get.find<CompletedRequestController>();

    var item = listOngoingRequest[index];
    item.loadingCancel = true;
    listOngoingRequest[index] = item;
    final data = await Service().cancelRequest(item.id);
    item.loadingCancel = false;

    if (data?.isSuccess ?? false) {
      listOngoingRequest.removeAt(index);
      _completedRequestCt.getCompletedRequest();
      CommonFunction.standartSnackbar('Berhasil Cancel: ${item.name}');
    } else {
      listOngoingRequest[index] = item;
      CommonFunction.standartSnackbar('Gagal Cancel: ${data?.message != null ? data.message : data.errors.length > 0 ? data.errors[0].toString() : 'Server Error'}');
    }
  }

  approveRequest(int index) async {
    final _completedRequestCt = Get.find<CompletedRequestController>();

    var item = listOngoingRequest[index];
    item.loadingApprove = true;
    listOngoingRequest[index] = item;
    final data = await Service().approveRequest(item.id);
    item.loadingApprove = false;

    if (data?.isSuccess ?? false) {
      listOngoingRequest.removeAt(index);
      _completedRequestCt.getCompletedRequest();
      CommonFunction.standartSnackbar('Berhasil Approve: ${item.name}');
    } else {
      listOngoingRequest[index] = item;
      CommonFunction.standartSnackbar('Gagal Approve: ${data?.message != null ? data.message : data.errors.length > 0 ? data.errors[0].toString() : item.name}');
    }
  }

  rejectRequest(int index) async {
    final _completedRequestCt = Get.find<CompletedRequestController>();

    var item = listOngoingRequest[index];
    item.loadingReject = true;
    listOngoingRequest[index] = item;
    final data = await Service().rejectRequest(RejectRequest(item.id, rejectReason.value));
    item.loadingReject = false;

    if (data?.isSuccess ?? false) {
      listOngoingRequest.removeAt(index);
      _completedRequestCt.getCompletedRequest();
      CommonFunction.standartSnackbar('Berhasil Reject: ${item.name}');
    } else {
      listOngoingRequest[index] = item;
      CommonFunction.standartSnackbar('Gagal Reject: ${data?.message != null ? data.message : data.errors.length > 0 ? data.errors[0].toString() : 'Server Error'}');
    }
  }

  changeStatus(int index, int status) {
    var data = listOngoingRequest[index];
    data.workflowStatus = status;
    listOngoingRequest[index] = data;
  }

}