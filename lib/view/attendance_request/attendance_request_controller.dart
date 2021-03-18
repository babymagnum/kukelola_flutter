import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/request/attendance_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';

class AttendanceRequestController extends GetxController {
  var loadingSubmit = false.obs;
  var loadingPickFile = false.obs;
  var form = AttendanceRequestForm().obs;

  updateForm(AttendanceRequestForm value) => form.value = value;
  setLoadingPickFile(bool value) => loadingPickFile.value = value;

  submitLeaveRequest() async {
    loadingSubmit.value = true;
    final data = await Service().submitAttendanceRequest(AttendanceRequest(homeController.userData.value.userId, form.value.startDate, form.value.endDate, form.value.reason, form.value.startHour, form.value.endHour, form.value.listFile));
    loadingSubmit.value = false;

    if (data?.isSuccess ?? false) {
      CommonFunction.standartSnackbar('Berhasil melakukan submit attendance request');
      updateForm(AttendanceRequestForm());
    } else {
      CommonFunction.standartSnackbar('Gagal melakukan submit attendance request');
    }
  }
}