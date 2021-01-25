import 'dart:io';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';

class AttendanceSummaryController extends GetxController {
  var loadingSummary = false.obs;
  var selectedDay = TextUtil.getCurrentDate('dd/MM/yyyy').obs;
  var visibleMonth = TextUtil.getCurrentDate('MMMM').obs;
  var listSummary = List<AttendanceRequestForm>().obs;
  var selectedSummary = AttendanceRequestForm().obs;

  setVisibleMonth(String value) => visibleMonth.value = value;

  setSelectedDay(String value) {
    selectedDay.value = value;
    print('selected day ${selectedDay.value}');

    if (listSummary.any((element) => element.startDate == selectedDay.value)) {
      setSelectedSummary(listSummary.firstWhere((element) => element.startDate == selectedDay.value));
    }
  }

  setSelectedSummary(AttendanceRequestForm value) => selectedSummary.value = value;

  populateSummary() async {
    loadingSummary.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loadingSummary.value = false;

    var item1 = AttendanceRequestForm();
    item1.startDate = '25/01/2021';
    item1.attachment = File('mantap.png');
    item1.reason = 'Butuh liburan...';
    item1.status = 'APPROVED';

    var item2 = AttendanceRequestForm();
    item2.startDate = '27/01/2021';
    item2.attachment = File('mantap.png');
    item2.reason = 'Butuh liburan lagi...';
    item2.status = 'CANCELED';

    listSummary.addAll([item1, item2]);
  }
}