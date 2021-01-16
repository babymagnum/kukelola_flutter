import 'dart:io';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';

class LeaveRequestController extends GetxController {
  var listLeaveType = List<LeaveTypeItem>().obs;
  var loadingSubmit = false.obs;
  var startDate = TextUtil.getCurrentDate('dd/MM/yyyy').obs;
  var endDate = TextUtil.getCurrentDate('dd/MM/yyyy').obs;
  var filePath = File('').obs;

  setStartDate(String value) => startDate.value = value;
  setEndDate(String value) => endDate.value = value;
  setFilePath(String value) => filePath.value = File(value);

  populateLeaveType() {
    var list = [
      LeaveTypeItem('Annual Leave'),
      LeaveTypeItem('Special Leave'),
      LeaveTypeItem('Sick Leave'),
    ];

    listLeaveType.clear();
    list.forEach((element) => listLeaveType.add(element));
    update();
  }

  submitLeaveRequest() async {
    loadingSubmit.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loadingSubmit.value = false;
  }
}