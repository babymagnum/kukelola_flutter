import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';

class HomeController extends GetxController {
  var listMenuHome = List<HomeMenuItem>().obs;
  
  populateMenu(BuildContext context) {
    var list = [
      HomeMenuItem('Online Attendance', 'assets/images/fa-solid_clock.svg', Color(0xFFAC58F8), 0),
      HomeMenuItem('Attendance Request', 'assets/images/attendance_request.svg', Color(0xFFF4F858), 0),
      HomeMenuItem('Overtime Request', 'assets/images/bx_bx-alarm-add.svg', Color(0xFFF16B6B), 0),
      HomeMenuItem('Leave Request', 'assets/images/fa-solid_plane.svg', Color(0xFF58A4F8), 0),
      HomeMenuItem('Business Trip', 'assets/images/business_trip 1.svg', Color(0xFF5C58F8), 0),
      HomeMenuItem('Reimbursment Request', 'assets/images/raphael_dollar.svg', Color(0xFF9BF34C), 0),
      HomeMenuItem('Pay Slip', 'assets/images/ant-design_printer-filled.svg', Color(0xFF58F8AC), 0),
      HomeMenuItem('Workflow Approval', 'assets/images/fa-solid_poll.svg', Color(0xFFF85C58), 3),
      HomeMenuItem('Calendar', 'assets/images/fa-solid_calendar-day.svg', Color(0xFFF858A4), 0),
    ];

    list.forEach((element) => listMenuHome.add(element));
    update();
  }
}