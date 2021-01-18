import 'dart:io';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';

class ReimbursmentRequestController extends GetxController {
  var loadingSubmit = false.obs;
  var attachment = File('').obs;
  var listReimbursment = List<ReimbursmentDetailItem>().obs;
  var loadingAttachment = false.obs;

  setLoadingAttachment(value) => loadingAttachment.value = value;
  setAttchment(String value) => attachment.value = File(value);

  submitReimbursment() async {
    loadingSubmit.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loadingSubmit.value = false;
  }

  addReimbursmentDetail(ReimbursmentDetailItem item) {
    listReimbursment.add(item);
    update();
  }

  removeReimbursmentDetail(int index) {
    listReimbursment.removeAt(index);
    update();
  }

  updateReimbursmentDetail(int index, ReimbursmentDetailItem item) {
    listReimbursment[index] = item;
    update();
  }
}