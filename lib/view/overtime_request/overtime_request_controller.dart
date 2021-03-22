import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/request/overtime_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';
import 'package:kukelola_flutter/view/home/home_controller.dart';

class OvertimeRequestController extends GetxController {
  var loadingSubmit = false.obs;
  var loadingPickFile = false.obs;
  var form = OvertimeRequestFormObject().obs;

  updateForm(OvertimeRequestFormObject value) => form.value = value;
  setLoadingPickFile(bool value) => loadingPickFile.value = value;

  submitLeaveRequest() async {
    loadingSubmit.value = true;
    final data = await Service().submitOvertimeRequest(OvertimeRequest(homeController.userData.value.userId, form.value.overtimeDate, form.value.reason, form.value.startHour, form.value.endHour, form.value.attachment));
    loadingSubmit.value = false;

    if (data?.isSuccess ?? false) {
      CommonFunction.standartSnackbar('Berhasil Submit Leave Request');
      updateForm(OvertimeRequestFormObject());
    } else {
      CommonFunction.standartSnackbar('Gagal Submit: ${data?.message != null ? data.message : data.errors.length > 0 ? data.errors[0].toString() : 'Server Error'}');
    }
  }
}