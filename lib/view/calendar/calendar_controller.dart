import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';
import 'package:kukelola_flutter/networking/model/corporate_calendar.dart';
import 'package:kukelola_flutter/networking/service/service.dart';

class CalendarController extends GetxController {
  var loadingCalendar = false.obs;
  var errorCalendar = false.obs;
  var listCalendar = List<CorporateCalendarData>().obs;
  
  populateData() async {
    loadingCalendar.value = true;
    final data = await Service().corporateCalendar('');
    loadingCalendar.value = false;
    
    if (data?.data != null) {
      errorCalendar.value = false;
      listCalendar.clear();
      data.data.forEach((element) => listCalendar.add(element));
      listCalendar.sort((a, b) => TextUtil.standartDateFormatToMillis(a.eventDate, 'dd MMM yyyy').compareTo(TextUtil.standartDateFormatToMillis(b.eventDate, 'dd MMM yyyy')));
    } else {
      errorCalendar.value = true;
    }
  }
}