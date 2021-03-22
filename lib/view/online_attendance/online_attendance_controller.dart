import 'dart:async';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';
import 'package:kukelola_flutter/networking/request/attendance_online_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';

class OnlineAttendanceController extends GetxController {
  var clock = TextUtil.getCurrentDate('dd/MM/yyyy HH:mm:ss').obs;
  var isIn = true.obs;
  var latLng = LatLng(-6.2088, 106.8456).obs;
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
    final data = await Service().attendanceOnline(AttendanceOnlineRequest(clock.value.split(' ')[0], clock.value.split(' ')[1].substring(0, clock.value.split(' ')[1].length - 3), isIn.value ? 1 : 2, latLng.value.latitude, latLng.value.longitude));
    loadingSubmit.value = false;

    if (data?.isSuccess ?? false) {
      CommonFunction.standartSnackbar('Berhasil Presensi ${isIn.value ? 'Masuk' : 'Keluar'}');
    } else {
      CommonFunction.standartSnackbar('Gagal Presensi ${isIn.value ? 'Masuk' : 'Keluar'}: ${data?.message != null ? data.message : data.errors.length > 0 ? data.errors[0].toString() : 'Server Error'}');
    }
  }
}