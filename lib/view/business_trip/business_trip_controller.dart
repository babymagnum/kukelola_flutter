import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import '../../main.dart';

class BusinessTripController extends GetxController {
  var form = BusinessTripForm().obs;
  var loadingPickFile = false.obs;
  var loadingSubmit = false.obs;

  setLoadingPickFile(bool value) => loadingPickFile.value = value;

  var fileSize = ''.obs;

  setForm(BusinessTripForm value) {
    try {
      fileSize.value = '(${(form.value.attachment.lengthSync() / 1024).round()} KB)';
    } catch (e) {
      form.value.attachment = File('');
    }
    form.value = value;
  }

  loadPreviousForm() {
    if ((commonController.preferences.getString(Constant.BUSINESS_TRIP_REQUEST) ?? '') == '') return;

    Map json = jsonDecode(commonController.preferences.getString(Constant.BUSINESS_TRIP_REQUEST));
    var data = BusinessTripForm().fromJson(json) as BusinessTripForm;
    try {
      fileSize.value = '(${(data.attachment.lengthSync() / 1024).round()} KB)';
    } catch (e) {
      data.attachment = File('');
    }
    form.value = data;
  }

  saveOrDeleteLocalForm(bool save) async {
    if (save) {
      String jsonForm = jsonEncode(BusinessTripForm().fromJson(form.value.toJson()));
      await commonController.preferences.setString(Constant.BUSINESS_TRIP_REQUEST, jsonForm);
    } else {
      await commonController.preferences.setString(Constant.BUSINESS_TRIP_REQUEST, '');
    }
  }

}