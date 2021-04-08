import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/request/attendance_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';

class AttendanceRequestController extends GetxController {
  var loadingSubmit = false.obs;
  var loadingPickFile = false.obs;
  var form = AttendanceRequestForm().obs;
  var fileSize = ''.obs;

  loadPreviousForm() {
    if ((commonController.preferences.getString(Constant.ATTENDANCE_REQUEST) ?? '') == '') return;

    Map json = jsonDecode(commonController.preferences.getString(Constant.ATTENDANCE_REQUEST));
    var data = AttendanceRequestForm().fromJson(json) as AttendanceRequestForm;
    // try {
    //   fileSize.value = '(${(data.attachment.lengthSync() / 1024).round()} KB)';
    // } catch (e) {
    //   data.attachment = File('');
    // }
    form.value = data;
  }

  updateForm(AttendanceRequestForm value) {
    // try {
    //   fileSize.value = '(${(form.value.attachment.lengthSync() / 1024).round()} KB)';
    // } catch (e) {
    //   form.value.attachment = File('');
    // }

    form.value = value;
  }
  setLoadingPickFile(bool value) => loadingPickFile.value = value;

  submitLeaveRequest() async {
    loadingSubmit.value = true;
    final data = await Service().submitAttendanceRequest(AttendanceRequest(homeController.userData.value.userId, form.value.startDate, form.value.endDate, form.value.reason, form.value.startHour, form.value.endHour, form.value.listFile));
    loadingSubmit.value = false;

    if (data?.isSuccess ?? false) {
      await commonController.preferences.setString(Constant.ATTENDANCE_REQUEST, '');
      CommonFunction.standartSnackbar('Berhasil Submit Attendance Request');
      updateForm(AttendanceRequestForm());
    } else {
      String jsonForm = jsonEncode(AttendanceRequestForm().fromJson(form.value.toJson()));
      await commonController.preferences.setString(Constant.ATTENDANCE_REQUEST, jsonForm);
      CommonFunction.standartSnackbar('Gagal Submit: ${data?.message != null ? data.message : data.errors.length > 0 ? data.errors[0].toString() : 'Server Error'}');
    }
  }
}