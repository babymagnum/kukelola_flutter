import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';

class CalendarController extends GetxController {
  var loadingCalendar = false.obs;
  var listCalendar = List<CalendarItem>().obs;

  @override
  void onInit() {
    super.onInit();

    populateData();
  }

  populateData() async {
    loadingCalendar.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loadingCalendar.value = false;

    listCalendar.addAll([
      CalendarItem('Event Name 1', TextUtil.getCurrentDate('dd/MM/yyyy'), 'Holiday', 'Event description goes here. Explain what the event is about so you’ll know what it is.'),
      CalendarItem('Event Name 2', TextUtil.getCurrentDate('dd/MM/yyyy'), 'Work Day', 'Event description goes here. Explain what the event is about so you’ll know what it is.'),
      CalendarItem('Event Name 3', TextUtil.getCurrentDate('dd/MM/yyyy'), 'Holiday', 'Event description goes here. Explain what the event is about so you’ll know what it is.'),
    ]);
  }
}