import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';

class HomeController extends GetxController {
  var listMenuHome = List<HomeMenuItem>().obs;
  
  populateMenu(BuildContext context) {
    var list = [
      HomeMenuItem('Online Attendance', 'assets/images/attendance_online 1.png', 0),
      HomeMenuItem('Attendance Request', 'assets/images/attendance_request 1.png', 0),
      HomeMenuItem('Overtime Request', 'assets/images/overtime_request 1.png', 0),
      HomeMenuItem('Leave Request', 'assets/images/leave_request 1.png', 0),
      HomeMenuItem('Business Trip', 'assets/images/business_trip 2.png', 0),
      HomeMenuItem('Reimbursment Request', 'assets/images/reimbursement 1.png', 0),
      HomeMenuItem('Pay Slip', 'assets/images/pay_slip 1.png', 0),
      HomeMenuItem('Workflow Approval', 'assets/images/workflow 1.png', 3),
      HomeMenuItem('Calendar', 'assets/images/calendar 1.png', 0),
    ];

    list.forEach((element) => listMenuHome.add(element));
    update();
  }
}