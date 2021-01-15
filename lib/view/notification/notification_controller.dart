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
      NotificationItem('0xFFA4F858', 'assets/images/fa-solid_hand-holding-usd.svg', 'Your reimbursement request is approved by manager.', 'Reimbursement Request', '04/12/2020 15:35', true),
      NotificationItem('0xFF58A4F8', 'assets/images/fa-solid_plane.svg', 'Your leave request is approved by manager.', 'Leave Request', '04/12/2020 10:35', false),
      NotificationItem('0xFFAC58F8', 'assets/images/fa-solid_ambulance.svg', 'Your reimbursement request is approved by manager.', 'Reimbursement Request', '04/12/2020 15:35', true),
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