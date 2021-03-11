import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/networking/model/notification.dart';
import 'package:kukelola_flutter/networking/request/notification_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';

class NotificationController extends GetxController {
  var listNotifikasi = List<NotificationData>().obs;
  var loadingNotifikasi = false.obs;
  var errorNotifikasi = false.obs;

  int _currentPage = 1;
  bool _loadMore = true;
  
  getNotifikasi(bool loadFirst) async {
    if (loadFirst) {
      _currentPage = 1;
      _loadMore = true;
      listNotifikasi.clear();
    }

    if (!_loadMore) return;

    loadingNotifikasi.value = true;
    final data = await Service().notification(NotificationRequest(_currentPage));
    loadingNotifikasi.value = false;

    if (data?.data != null) {
      _loadMore = data.data.length > 0;
      _currentPage += 1;
      errorNotifikasi.value = false;
      listNotifikasi.addAll(data.data);
    } else {
      errorNotifikasi.value = true;
    }
  }
}