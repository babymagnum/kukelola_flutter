import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/model/special_leave_list.dart';
import 'package:kukelola_flutter/networking/request/leave_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';

class LeaveRequestController extends GetxController {
  var listLeaveType = [
    LeaveTypeItem('Annual Leave', '1'),
    LeaveTypeItem('Special Leave', '2'),
    LeaveTypeItem('Unpaid Leave', '3'),
  ];
  var listSpecialLeave = <SpecialLeaveListData>[];
  var loadingSubmit = false.obs;
  var loadingPickFile = false.obs;
  var loadingSpecialLeaveType = false.obs;
  var errorSpecialLeaveType = false.obs;
  var form = LeaveRequestForm().obs;
  var fileSize = ''.obs;

  updateForm(LeaveRequestForm value) {
    try {
      fileSize.value = '(${(form.value.attachment.lengthSync() / 1024).round()} KB)';
    } catch (e) {
      form.value.attachment = File('');
    }

    form.value = value;
  }
  setLoadingPickFile(bool value) => loadingPickFile.value = value;

  loadPreviousForm() {
    if ((commonController.preferences.getString(Constant.LEAVE_REQUEST) ?? '') == '') return;

    Map json = jsonDecode(commonController.preferences.getString(Constant.LEAVE_REQUEST));
    var data = LeaveRequestForm().fromJson(json) as LeaveRequestForm;
    try {
      fileSize.value = '(${(data.attachment.lengthSync() / 1024).round()} KB)';
    } catch (e) {
      data.attachment = File('');
    }
    form.value = data;
  }

  populateSpecialLeaveType() async {
    if (listSpecialLeave.length > 0) return;

    loadingSpecialLeaveType.value = true;
    final data = await Service().specialLeaveList();
    loadingSpecialLeaveType.value = false;

    if (data?.data != null) {
      errorSpecialLeaveType.value = false;
      listSpecialLeave.addAll(data.data);
    } else {
      errorSpecialLeaveType.value = true;
    }
  }

  submitLeaveRequest() async {
    loadingSubmit.value = true;
    final data = await Service().submitLeaveRequest(LeaveRequest(homeController.userData.value.userId, form.value.startDate, form.value.reason, form.value.endDate, form.value.attachment, form.value.leaveType.id));
    loadingSubmit.value = false;

    if (data?.isSuccess ?? false) {
      await commonController.preferences.setString(Constant.LEAVE_REQUEST, '');
      CommonFunction.standartSnackbar('Berhasil Submit Leave Request');
      updateForm(LeaveRequestForm());
    } else {
      String jsonForm = jsonEncode(LeaveRequestForm().fromJson(form.value.toJson()));
      await commonController.preferences.setString(Constant.LEAVE_REQUEST, jsonForm);
      CommonFunction.standartSnackbar('Gagal Submit: ${data?.message != null ? data.message : data.errors.length > 0 ? data.errors[0].toString() : 'Server Error'}');
    }
  }
}