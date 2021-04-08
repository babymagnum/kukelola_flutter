import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/networking/request/overtime_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';
import '../../main.dart';

class OvertimeRequestController extends GetxController {
  var loadingSubmit = false.obs;
  var loadingPickFile = false.obs;
  var form = OvertimeRequestFormObject().obs;
  var fileSize = ''.obs;

  updateForm(OvertimeRequestFormObject value) {
    try {
      fileSize.value = '(${(form.value.attachment.lengthSync() / 1024).round()} KB)';
    } catch (e) {
      form.value.attachment = File('');
    }
    form.value = value;
  }

  loadPreviousForm() {
    if ((commonController.preferences.getString(Constant.OVERTIME_REQUEST) ?? '') == '') return;

    Map json = jsonDecode(commonController.preferences.getString(Constant.OVERTIME_REQUEST));
    var data = OvertimeRequestFormObject().fromJson(json) as OvertimeRequestFormObject;
    try {
      fileSize.value = '(${(data.attachment.lengthSync() / 1024).round()} KB)';
    } catch (e) {
      data.attachment = File('');
    }
    form.value = data;
  }

  setLoadingPickFile(bool value) => loadingPickFile.value = value;

  submitLeaveRequest() async {
    loadingSubmit.value = true;
    final data = await Service().submitOvertimeRequest(OvertimeRequest(form.value.overtimeDate, form.value.reason, form.value.startHour, form.value.endHour, form.value.attachment));
    loadingSubmit.value = false;

    if (data?.isSuccess ?? false) {
      await commonController.preferences.setString(Constant.OVERTIME_REQUEST, '');
      CommonFunction.standartSnackbar('Berhasil Submit Leave Request');
      updateForm(OvertimeRequestFormObject());
    } else {
      String jsonForm = jsonEncode(OvertimeRequestFormObject().fromJson(form.value.toJson()));
      await commonController.preferences.setString(Constant.OVERTIME_REQUEST, jsonForm);
      CommonFunction.standartSnackbar('Gagal Submit: ${data?.message != null ? data.message : data.errors.length > 0 ? data.errors[0].toString() : 'Server Error'}');
    }
  }
}