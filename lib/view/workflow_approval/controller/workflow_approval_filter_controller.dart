import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/view/workflow_approval/controller/completed_request_controller.dart';
import 'package:kukelola_flutter/view/workflow_approval/controller/ongoing_request_controller.dart';
import 'package:kukelola_flutter/view/workflow_approval/controller/workflow_approval_controller.dart';

class WorkflowApprovalFilterController extends GetxController {
  var _completedRequestCt = Get.find<CompletedRequestController>();
  var _ongoingRequestCt = Get.find<OngoingRequestController>();
  var _workflowApprovalCt = Get.find<WorkflowApprovalController>();

  var listRoute = [
    CommonType('All Route', 0),
    CommonType('Incoming', 1),
    CommonType('Outgoing', 2),
  ];

  var listRequest = [
    CommonType('All Request', 0),
    CommonType('Leave Request', 1),
    CommonType('Attendance Request', 2),
    CommonType('Overtime Request', 3),
    CommonType('Reimbursment Request', 4),
    CommonType('Business Trip Request', 5),
  ];

  var form = WorkflowApprovalFilterForm().obs;

  setForm(WorkflowApprovalFilterForm value) => form.value = value;

  filter() async {
    Get.back();

    if (_workflowApprovalCt.currentPage.value == 0) {
      await _ongoingRequestCt.getOngoingRequest();
      if (!_ongoingRequestCt.errorRequest.value) setForm(WorkflowApprovalFilterForm());
    } else {
      await _completedRequestCt.getCompletedRequest();
      if (!_completedRequestCt.errorRequest.value) setForm(WorkflowApprovalFilterForm());
    }
  }
}