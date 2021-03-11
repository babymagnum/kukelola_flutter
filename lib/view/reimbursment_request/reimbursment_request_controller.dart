import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/request/reimbursment_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';

class ReimbursmentRequestController extends GetxController {
  var loadingSubmit = false.obs;
  var loadingAttachment = false.obs;
  var form = ReimbursmentRequestForm().obs;

  setLoadingAttachment(value) => loadingAttachment.value = value;
  updateForm(ReimbursmentRequestForm value) => form.value = value;

  submitReimbursment() async {
    loadingSubmit.value = true;
    final data = await Service().submitReimbursmentRequest(ReimbursmentRequest(homeController.userData.value.userId, form.value.reason, form.value.attachment, form.value.listDetails));
    loadingSubmit.value = false;

    if (data?.isSuccess ?? false) {
      CommonFunction.standartSnackbar('Berhasil melakukan submit overtime request');
      updateForm(ReimbursmentRequestForm());
    } else {
      CommonFunction.standartSnackbar('Gagal melakukan submit overtime request');
    }
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