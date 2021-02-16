import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';

class CompletedRequestController extends GetxController {
  var loading = false.obs;
  var listCompletedRequest = List<WorkflowApprovalItem>().obs;

  getOngoingRequest() async {
    loading.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loading.value = false;
    var list = [
      WorkflowApprovalItem("i'll have my wedding ceremony", 'REJECTED', 'Special Leave', 'Married', '11/01/2021', '13/01/2021', 'Arief Zainuri', 'Developer', 'K009182', false),
      WorkflowApprovalItem('Mantap', 'CANCELED', 'Unpaid Leave', '', '15/01/2021', '16/01/2021', 'Arief Zainuri', 'Developer', 'K009182', false),
    ];

    listCompletedRequest.clear();
    listCompletedRequest.addAll(list);
    update();
  }

}