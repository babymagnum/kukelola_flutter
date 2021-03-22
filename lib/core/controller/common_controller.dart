import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/service/service.dart';
import 'package:kukelola_flutter/view/login/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/date_symbol_data_local.dart';

class CommonController extends GetxController {

  var notConnected = false.obs;
  var closeApps = false.obs;
  var language = Constant.INDONESIAN.obs;
  var inputTapHeight = (0.0).obs;
  var loadingLogout = false.obs;
  var autoLogin = false.obs;
  var standartDropdownItemSize = Size(0, 0).obs;
  SharedPreferences preferences;

  setStandartDropdownItemSize(value) => standartDropdownItemSize.value = value;
  setAutoLogin(bool value) => autoLogin.value = value;
  setCloseapps(value) => closeApps.value = value;
  setNotConnected(value) => notConnected.value = value;
  setInputTapHeight(double value) {
    if (inputTapHeight.value == 0) inputTapHeight.value = value;
  }

  setLanguage(BuildContext context, String value) async {
    final preference = await SharedPreferences.getInstance();
    await preference.setString(Constant.LANGUANGE_CODE, value);
    language.value = value;
    Get.updateLocale(Locale(language.value));
  }

  loadLanguage() async {
    language.value = commonController?.preferences?.getString(Constant.LANGUANGE_CODE) ?? Constant.INDONESIAN;
    initializeDateFormatting(language.value, null);
    Get.updateLocale(Locale(language.value));
  }

  initValue() async {
    preferences = await SharedPreferences.getInstance();
  }

  logout() async {
    loadingLogout.value = true;
    final data = await Service().logout();
    loadingLogout.value = false;

    if (data?.isSuccess ?? false) {
      commonController.preferences.setBool(Constant.IS_LOGIN, false);
      commonController.preferences.setBool(Constant.IS_PASS_LOGIN, false);
      Get.offAll(LoginView());
    } else {
      CommonFunction.standartSnackbar('Gagal Logout: ${data?.message != null ? data.message : data.errors.length > 0 ? data.errors[0].toString() : 'Server Error'}');
    }
  }

  standartLogout() {
    autoLogin.value = true;
    commonController.preferences.setBool(Constant.IS_LOGIN, false);
    commonController.preferences.setBool(Constant.IS_PASS_LOGIN, false);
    Get.offAll(LoginView());
  }
}