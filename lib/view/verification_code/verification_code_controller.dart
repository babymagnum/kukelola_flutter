import 'dart:async';

import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/view/container_home/container_home_view.dart';
import 'package:kukelola_flutter/view/login/login_controller.dart';

class VerificationCodeController extends GetxController {

  var seconds = 60.obs;
  var minutes = 0.obs;
  var chances = 3.obs;
  var timesUp = false.obs;
  var loadingResendOtp = false.obs;
  var loadingVerify = false.obs;

  var _timer;
  var _loginCt = Get.find<LoginController>();

  startTimer() {
    seconds.value = 60;
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

  verifyOtp(String otp) async {
    loadingVerify.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loadingVerify.value = false;

    if (otp == commonController.preferences?.getString(Constant.OTP) ?? '') {
      commonController.preferences.setBool(Constant.IS_LOGIN, true);
      Get.offAll(() => ContainerHomeView());
    } else {
      CommonFunction.standartSnackbar('OTP yang dimasukan salah');
    }
  }

  resendOtp() async {
    timesUp.value = false;
    await _loginCt.login(true);

    if (_loginCt.successLogin.value) startTimer();
    else timesUp.value = true;
  }
}