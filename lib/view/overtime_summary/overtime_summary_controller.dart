import 'dart:io';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';

class OvertimeSummaryController extends GetxController {
  var loadingSummary = false.obs;
  var listSummary = List<OvertimeRequestFormObject>().obs;

  populateData() async {
    loadingSummary.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loadingSummary.value = false;

    var leave1 = OvertimeRequestFormObject();
    leave1.startHour = '19:00';
    leave1.endHour = '20:00';
    leave1.overtimeDate = '13/01/2021';
    leave1.attachment = File('mantap1.png');
    leave1.reason = 'Pingin liburan sepertinya bos.';
    leave1.status = 'PENDING';

    var leave2 = OvertimeRequestFormObject();
    leave2.startHour = '19:00';
    leave2.endHour = '20:00';
    leave2.overtimeDate = '13/01/2021';
    leave2.attachment = File('mantap2.png');
    leave2.reason = 'Hmmmm';
    leave2.status = 'APPROVED';

    listSummary.clear();
    listSummary.addAll([leave1, leave2]);
  }

  cancelLeave(int index) async {
    var data = listSummary[index];
    data.loading = true;
    listSummary[index] = data;
    await Future.delayed(Duration(seconds: 1), () {});
    data.loading = false;
    data.status = 'CANCELED';
    listSummary[index] = data;
    CommonFunction.standartSnackbar('Request cancelled succesfully');
  }

  changeStatusToCanceled(int index) {
    var data = listSummary[index];
    data.status = 'CANCELED';
    listSummary[index] = data;
  }
}