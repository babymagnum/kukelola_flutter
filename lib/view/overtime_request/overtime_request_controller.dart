import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/networking/request/overtime_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';

class OvertimeRequestController extends GetxController {
  var loadingSubmit = false.obs;
  var loadingPickFile = false.obs;
  var form = OvertimeRequestFormObject().obs;

  updateForm(OvertimeRequestFormObject value) => form.value = value;
  setLoadingPickFile(bool value) => loadingPickFile.value = value;

  submitLeaveRequest() async {
    loadingSubmit.value = true;
    final data = await Service().submitOvertimeRequest(OvertimeRequest(Constant.DUMMY_USER_ID, form.value.overtimeDate, form.value.reason, form.value.startHour, form.value.endHour, form.value.attachment));
    loadingSubmit.value = false;

    if (data?.IsSuccess ?? false) {

    } else {

    }
  }
}