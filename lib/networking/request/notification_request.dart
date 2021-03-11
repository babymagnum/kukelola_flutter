import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/main.dart';

class NotificationRequest {

  int page;

  NotificationRequest(this.page);

  dynamic body() {
    return {
      "UserId": homeController.userData.value.userId,
      "Take": 10,
      "Page": page
    };
  }
}