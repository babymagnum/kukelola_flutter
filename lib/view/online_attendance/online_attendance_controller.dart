import 'dart:async';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';

class OnlineAttendanceController extends GetxController {
  var clock = TextUtil.getCurrentDate('dd/MM/yyyy HH:mm:ss').obs;
  var isIn = true.obs;
  var latLng = LatLng(0, 0).obs;
  var loadingSubmit = false.obs;

  GoogleMapController googleMapController;

  Timer _timer;

  setGoogleMapController(GoogleMapController value) => googleMapController = value;
  setLatLng(LatLng value) => latLng.value = value;
  setIsIn(bool value) => isIn.value = value;
  listenClock() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      clock.value = TextUtil.getCurrentDate('dd/MM/yyyy HH:mm:ss');
    });
  }

  @override
  void onClose() {
    _timer?.cancel();

    super.onClose();
  }

  submit() async {
    loadingSubmit.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loadingSubmit.value = false;
  }
}