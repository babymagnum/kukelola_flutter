import 'dart:async';

import 'package:get/get.dart';

class VerificationCodeController extends GetxController {

  var seconds = 60.obs;
  var minutes = 0.obs;
  var chances = 3.obs;
  var timesUp = false.obs;
  var loadingResendOtp = false.obs;
  var loadingVerify = false.obs;

  var _timer;

  startTimer() {
    seconds.value = 10;
    minutes.value = 0;

    seconds -= 1;

    if (_timer != null) _timer.cancel();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (minutes.value == 0 && seconds.value == 1) {
        timesUp.value = true;
        timer.cancel();
        minutes.value = 0;
        seconds.value = 0;
      } else {
        seconds -= 1;
        if (seconds.value == 0) minutes -= 1;
      }
    });
  }

  verifyOtp() async {
    loadingVerify.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loadingVerify.value = false;
  }

  resendOtp() async {
    timesUp.value = false;
    loadingResendOtp.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loadingResendOtp.value = false;
    chances.value -= 1;
    startTimer();
  }
}