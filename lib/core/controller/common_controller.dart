import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/date_symbol_data_local.dart';

class CommonController extends GetxController {

  var notConnected = false.obs;
  var logout = false.obs;
  var closeApps = false.obs;
  var language = Constant.INDONESIAN.obs;
  var inputTapHeight = (0.0).obs;

  setLogout(value) => logout.value = value;
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

  loadLanguage(BuildContext context) async {
    final preference = await SharedPreferences.getInstance();
    language.value = preference?.getString(Constant.LANGUANGE_CODE) ?? Constant.INDONESIAN;
    initializeDateFormatting(language.value, null);
    Get.updateLocale(Locale(language.value));
  }
}