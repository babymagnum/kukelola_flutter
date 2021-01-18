import 'dart:io';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';

class LeaveRequestController extends GetxController {
  var listLeaveType = List<LeaveTypeItem>().obs;
  var listSpecialLeave = List<LeaveTypeItem>().obs;
  var loadingSubmit = false.obs;
  var loadingPickFile = false.obs;
  var startDate = TextUtil.getCurrentDate('dd/MM/yyyy').obs;
  var endDate = TextUtil.getCurrentDate('dd/MM/yyyy').obs;
  LeaveTypeItem leaveType;
  LeaveTypeItem specialLeaveType;
  var filePath = File('').obs;
  var showSpecialLeave = false.obs;

  setStartDate(String value) => startDate.value = value;
  setEndDate(String value) => endDate.value = value;
  setFilePath(String value) => filePath.value = File(value);
  setLeaveType(LeaveTypeItem value) {
    leaveType = value;
    showSpecialLeave.value = value.label == 'Special Leave';
    update();
  }
  setSpecialLeaveType(LeaveTypeItem value) {
    specialLeaveType = value;
    update();
  }
  setLoadingPickFile(bool value) => loadingPickFile.value = value;
  setShowSpecialLeave(bool value) => showSpecialLeave.value = value;

  @override
  void onInit() {
    populateLeaveType();

    super.onInit();
  }

  populateLeaveType() {
    var leaveType = [
      LeaveTypeItem('Annual Leave'),
      LeaveTypeItem('Special Leave'),
      LeaveTypeItem('Sick Leave'),
    ];

    var specialLeave = [
      LeaveTypeItem('Wedding Leave'),
      LeaveTypeItem('Born Kids Leave'),
      LeaveTypeItem('Parents Meeting Leave'),
    ];

    leaveType.forEach((element) => listLeaveType.add(element));
    specialLeave.forEach((element) => listSpecialLeave.add(element));
    update();
  }

  submitLeaveRequest() async {
    loadingSubmit.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loadingSubmit.value = false;
  }
}