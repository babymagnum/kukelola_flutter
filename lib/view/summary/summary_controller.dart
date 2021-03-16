import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';

class SummaryController extends GetxController {
  var listMenu = [
    SummaryMenuItems('assets/images/attendance_request 1.png', 'Attendance Summary'),
    SummaryMenuItems('assets/images/leave_request 1.png', 'Leave Summary'),
    SummaryMenuItems('assets/images/overtime_request 1.png', 'Overtime Summary'),
    SummaryMenuItems('assets/images/reimbursement 1.png', 'Reimbursement Summary'),
  ];
}