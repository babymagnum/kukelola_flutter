import 'package:get/get.dart';

class WorkflowApprovalController extends GetxController {
  var currentPage = 0.obs;

  setCurrentPage(int value) => currentPage.value = value;
}