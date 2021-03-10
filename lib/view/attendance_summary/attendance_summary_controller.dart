import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';
import 'package:kukelola_flutter/networking/model/attendance_summary_grid.dart';
import 'package:kukelola_flutter/networking/service/service.dart';

class AttendanceSummaryController extends GetxController {
  var loadingSummary = false.obs;
  var errorSummary = false.obs;
  var selectedDay = TextUtil.getCurrentDate('dd/MM/yyyy').obs;
  var visibleMonth = TextUtil.getCurrentDate('MMMM').obs;
  var listSummary = List<AttendanceSummaryGridData>().obs;
  var selectedSummary = AttendanceSummaryGridData().obs;

  setVisibleMonth(String value) => visibleMonth.value = value;

  setSelectedDay(String value) {
    selectedDay.value = value;
    
    if (listSummary.any((element) => element.startDate == selectedDay.value)) {
      setSelectedSummary(listSummary.singleWhere((element) => element.startDate == selectedDay.value));
    } else {
      getSummary();
    }
  }

  setSelectedSummary(AttendanceSummaryGridData value) => selectedSummary.value = value;

  getSummary() async {
    loadingSummary.value = true;
    final data = await Service().attendanceSummaryGrid(selectedDay.value);
    loadingSummary.value = false;

    if (data?.data != null) {
      errorSummary.value = false;
      listSummary.add(data.data);
      setSelectedDay(selectedDay.value);
    } else {
      errorSummary.value = true;
    }
  }
}