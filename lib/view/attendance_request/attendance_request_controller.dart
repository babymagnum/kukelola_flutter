import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
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
    final data = await Service().submitAttendanceRequest(AttendanceRequest(Constant.DUMMY_USER_ID, form.value.startDate, form.value.endDate, form.value.reason, form.value.startHour, form.value.endHour, form.value.attachment));
    loadingSubmit.value = false;

    if (data.IsSuccess) {

    } else {

    }
  }
}