import 'dart:io';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';

class OvertimeRequestController extends GetxController {
  var loadingSubmit = false.obs;
  var loadingPickFile = false.obs;
  var form = OvertimeRequestFormObject().obs;

  updateForm(OvertimeRequestFormObject value) => form.value = value;
  setLoadingPickFile(bool value) => loadingPickFile.value = value;

  submitLeaveRequest() async {
    loadingSubmit.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loadingSubmit.value = false;
  }
}