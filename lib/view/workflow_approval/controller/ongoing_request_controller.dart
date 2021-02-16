import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';

class OngoingRequestController extends GetxController {
  var rejectReason = ''.obs;
  var loading = false.obs;
  var loadingReject = false.obs;
  var listOngoingRequest = List<WorkflowApprovalItem>().obs;

  setRejectReason(String value) => rejectReason.value = value;

  getOngoingRequest() async {
    loading.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loading.value = false;
    var list = [
      WorkflowApprovalItem("i'll have my wedding ceremony", '', 'Special Leave', 'Married', '11/01/2021', '13/01/2021', 'Arief Zainuri', 'Developer', 'K009182', true),
      WorkflowApprovalItem('Mantap', '', 'Unpaid Leave', '', '15/01/2021', '16/01/2021', 'Arief Zainuri', 'Developer', 'K009182', false),
      WorkflowApprovalItem('Mantap', '', 'Annual Leave', '', '11/01/2021', '13/01/2021', 'Arief Zainuri', 'Developer', 'K009182', false),
    ];

    listOngoingRequest.clear();
    listOngoingRequest.addAll(list);
    update();
  }

  cancelRequest(int index) async {
    var data = listOngoingRequest[index];
    data.loadingCancel = true;
    listOngoingRequest[index] = data;
    await Future.delayed(Duration(seconds: 1), () {});
    data.loadingCancel = false;
    data.status = 'CANCELED';
    listOngoingRequest[index] = data;
    CommonFunction.standartSnackbar('Request cancelled succesfully');
  }

  approveRequest(int index) async {
    var data = listOngoingRequest[index];
    data.loadingApprove = true;
    listOngoingRequest[index] = data;
    await Future.delayed(Duration(seconds: 1), () {});
    data.loadingApprove = false;
    data.status = 'APPROVED';
    listOngoingRequest[index] = data;
    CommonFunction.standartSnackbar('Request approved succesfully');
  }

  rejectRequest(int index) async {
    var data = listOngoingRequest[index];
    data.loadingReject = true;
    listOngoingRequest[index] = data;
    await Future.delayed(Duration(seconds: 1), () {});
    data.loadingReject = false;
    data.status = 'REJECTED';
    listOngoingRequest[index] = data;
    CommonFunction.standartSnackbar('Request rejected succesfully');
  }

  changeStatus(int index, String status) {
    var data = listOngoingRequest[index];
    data.status = status;
    listOngoingRequest[index] = data;
  }

}