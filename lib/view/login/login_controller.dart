import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/generated/json/token_helper.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/model/token.dart';
import 'package:kukelola_flutter/networking/request/login_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';
import 'package:kukelola_flutter/view/container_home/container_home_view.dart';
import 'package:kukelola_flutter/view/verification_code/verification_code_view.dart';

class LoginController extends GetxController {
  var obsecure = true.obs;
  var loadingLogin = false.obs;
  var successLogin = false.obs;
  var form = LoginForm().obs;

  setObsecure(bool value) => obsecure.value = value;
  setForm(LoginForm value) => form.value = value;

  String _random4Digit() {
    return '${TextUtil.randomInt(0, 9)}${TextUtil.randomInt(0, 9)}${TextUtil.randomInt(0, 9)}${TextUtil.randomInt(0, 9)}';
  }

  login(bool resendOtp) async {
    var otp = _random4Digit();
    loadingLogin.value = true;
    final data = await Service().token(LoginRequest(
        resendOtp ? commonController.preferences.getString(Constant.EMAIL) : form.value.username,
        resendOtp ? commonController.preferences.getString(Constant.PASSWORD) : form.value.password,
        otp, commonController.autoLogin.value ? 'true' : 'false'));
    loadingLogin.value = false;

    if (data?.accessToken != null) {
      if (form.value.username.split('@')[1] == 'kukelola.com') {
        commonController.setAutoLogin(true);
        await commonController.preferences.setBool(Constant.IS_PASS_LOGIN, false);
      } else {
        await commonController.preferences.setBool(Constant.IS_PASS_LOGIN, true);
      }

      successLogin.value = true;
      await commonController.preferences.setString(Constant.OTP, otp);
      await commonController.preferences.setString(Constant.TOKEN, data.accessToken);
      String token = jsonEncode(tokenFromJson(Token(), data.toJson()));
      await commonController.preferences.setString(Constant.OBJECT_TOKEN, token);
      if (commonController.autoLogin.value) await commonController.preferences.setBool(Constant.IS_LOGIN, true);

      if (resendOtp) return;

      await commonController.preferences.setString(Constant.EMAIL, form.value.username);
      await commonController.preferences.setString(Constant.PASSWORD, form.value.password);
      await Get.offAll(() => commonController.autoLogin.value ? ContainerHomeView() : VerificationCodeView());
    } else {
      successLogin.value = false;
      CommonFunction.standartSnackbar('Gagal Login: ${data.errorDescription ?? data.errorMessage}');

      if (commonController.autoLogin.value) {
        commonController.setAutoLogin(false);
        await commonController.preferences.setBool(Constant.IS_AUTO_LOGIN, false);
      }
    }
  }
}