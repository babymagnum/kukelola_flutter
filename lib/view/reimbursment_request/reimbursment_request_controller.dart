import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/request/reimbursment_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';

class ReimbursmentRequestController extends GetxController {
  var loadingSubmit = false.obs;
  var loadingAttachment = false.obs;
  var form = ReimbursmentRequestForm().obs;
  var listDetails = <ReimbursmentDetailItem>[].obs;
  var fileSize = ''.obs;

  setLoadingAttachment(value) => loadingAttachment.value = value;

  updateForm(ReimbursmentRequestForm value) {
    try {
      fileSize.value = '(${(form.value.attachment.lengthSync() / 1024).round()} KB)';
    } catch (e) {
      form.value.attachment = File('');
    }
    form.value = value;
  }

  loadPreviousForm() {
    if ((commonController.preferences.getString(Constant.REIMBURSEMENT_REQUEST) ?? '') == '') return;

    Map json = jsonDecode(commonController.preferences.getString(Constant.REIMBURSEMENT_REQUEST));
    var data = ReimbursmentRequestForm().fromJson(json) as ReimbursmentRequestForm;
    try {
      fileSize.value = '(${(data.attachment.lengthSync() / 1024).round()} KB)';
    } catch (e) {
      data.attachment = File('');
    }
    form.value = data;
    listDetails.addAll(form.value.listDetail);
  }

  submitReimbursment() async {
    loadingSubmit.value = true;
    final data = await Service().submitReimbursmentRequest(ReimbursmentRequest(homeController.userData.value.userId, form.value.reason, form.value.attachment, listDetails));
    loadingSubmit.value = false;

    if (data?.isSuccess ?? false) {
      await commonController.preferences.setString(Constant.REIMBURSEMENT_REQUEST, '');
      CommonFunction.standartSnackbar('Berhasil Submit Reimbursement Request');
      updateForm(ReimbursmentRequestForm());
    } else {
      form.value.listDetail.clear();
      form.value.listDetail.addAll(listDetails);

      String jsonForm = jsonEncode(ReimbursmentRequestForm().fromJson(form.value.toJson()));
      await commonController.preferences.setString(Constant.REIMBURSEMENT_REQUEST, jsonForm);
      CommonFunction.standartSnackbar('Gagal Submit: ${data?.message != null ? data.message : data.errors.length > 0 ? data.errors[0].toString() : 'Server Error'}');
    }
  }

  addReimbursmentDetail(ReimbursmentDetailItem item) {
    listDetails.add(item);
  }

  removeReimbursmentDetail(int index) {
    listDetails.removeAt(index);
  }

  updateReimbursmentDetail(int index, ReimbursmentDetailItem item) {
    listDetails[index] = item;
  }
}