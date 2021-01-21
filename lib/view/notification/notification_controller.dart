import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';

class NotificationController extends GetxController {
  var listNotifikasi = List<NotificationItem>().obs;
  var loadingNotifikasi = false.obs;
  var errorNotifikasi = false.obs;
  
  getNotifikasi() async {
    loadingNotifikasi.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loadingNotifikasi.value = false;
    
    var list = [
      NotificationItem('assets/images/reimbursement 1.png', 'Your reimbursement request is approved by manager.', 'Reimbursement Request', '04/12/2020 15:35', true),
      NotificationItem('assets/images/leave_request 1.png', 'Your leave request is approved by manager.', 'Leave Request', '04/12/2020 10:35', false),
      NotificationItem('assets/images/notif_sickleave_req 1.png', 'Your sick leave request is approved by manager.', 'Sick Leave', '04/12/2020 15:35', true),
    ];

    list.forEach((element) => listNotifikasi.add(element));
    update();
  }

  notificationClick(int index, NotificationItem item) {
    item.unread = false;

    listNotifikasi[index] = item;
    update();
  }
}