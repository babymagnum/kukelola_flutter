import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';

class ReimbursmentRequestController extends GetxController {
  var loadingSubmit = false.obs;
  var loadingAttachment = false.obs;
  var form = ReimbursmentRequestForm().obs;

  setLoadingAttachment(value) => loadingAttachment.value = value;
  updateForm(ReimbursmentRequestForm value) => form.value = value;

  submitReimbursment() async {
    loadingSubmit.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loadingSubmit.value = false;
  }

  addReimbursmentDetail(ReimbursmentDetailItem item) {
    form.value.listDetails.add(item);
    updateForm(form.value);
  }

  removeReimbursmentDetail(int index) {
    form.value.listDetails.removeAt(index);
    updateForm(form.value);
  }

  updateReimbursmentDetail(int index, ReimbursmentDetailItem item) {
    form.value.listDetails[index] = item;
    updateForm(form.value);
  }
}