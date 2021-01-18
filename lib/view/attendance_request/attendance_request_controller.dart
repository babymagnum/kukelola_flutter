import 'dart:io';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';

class AttendanceRequestController extends GetxController {
  var loadingSubmit = false.obs;
  var loadingPickFile = false.obs;
  var startDate = TextUtil.getCurrentDate('dd/MM/yyyy').obs;
  var endDate = TextUtil.getCurrentDate('dd/MM/yyyy').obs;
  var startHour = TextUtil.getCurrentDate('HH:mm').obs;
  var endHour = TextUtil.getCurrentDate('HH:mm').obs;
  var filePath = File('').obs;

  setStartDate(String value) => startDate.value = value;
  setEndDate(String value) => endDate.value = value;
  setFilePath(String value) => filePath.value = File(value);
  setLoadingPickFile(bool value) => loadingPickFile.value = value;
  setStartHour(String value) => startHour.value = value;
  setEndHour(String value) => endHour.value = value;

  submitLeaveRequest() async {
    loadingSubmit.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loadingSubmit.value = false;
  }
}