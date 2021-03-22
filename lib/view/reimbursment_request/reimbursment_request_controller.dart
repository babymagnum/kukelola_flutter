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
  var listDetails = List<ReimbursmentDetailItem>().obs;

  setLoadingAttachment(value) => loadingAttachment.value = value;
  updateForm(ReimbursmentRequestForm value) => form.value = value;

  submitReimbursment() async {
    loadingSubmit.value = true;
    final data = await Service().submitReimbursmentRequest(ReimbursmentRequest(homeController.userData.value.userId, form.value.reason, form.value.attachment, listDetails));
    loadingSubmit.value = false;

    if (data?.isSuccess ?? false) {
      CommonFunction.standartSnackbar('Berhasil Submit Reimbursement Request');
      updateForm(ReimbursmentRequestForm());
    } else {
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