import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/service/service.dart';
import 'package:kukelola_flutter/view/login/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:trust_location/trust_location.dart';

class CommonController extends GetxController {

  var notConnected = false.obs;
  var closeApps = false.obs;
  var language = Constant.INDONESIAN.obs;
  var inputTapHeight = (0.0).obs;
  var loadingLogout = false.obs;
  var autoLogin = false.obs;
  var standartDropdownItemSize = Size(0, 0).obs;
  var isMocked = false.obs;
  SharedPreferences preferences;

  setIsMocked(value) => isMocked.value = value;
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

    autoLogin.value = preferences.getBool(Constant.IS_AUTO_LOGIN) ?? false;
  }

  logout() async {
    loadingLogout.value = true;
    final data = await Service().logout();
    loadingLogout.value = false;

    if (data?.isSuccess ?? false) {
      setAutoLogin(false);
      commonController.preferences.setBool(Constant.IS_AUTO_LOGIN, false);
      commonController.preferences.setBool(Constant.IS_LOGIN, false);
      commonController.preferences.setBool(Constant.IS_PASS_LOGIN, false);
      Get.offAll(() => LoginView());
    } else {
      CommonFunction.standartSnackbar('Gagal Logout: ${data?.message != null ? data.message : data.errors.length > 0 ? data.errors[0].toString() : 'Server Error'}');
    }
  }

  standartLogout() async {
    setAutoLogin(true);
    commonController.preferences.setBool(Constant.IS_AUTO_LOGIN, true);
    await commonController.preferences.setBool(Constant.IS_LOGIN, false);
    await commonController.preferences.setBool(Constant.IS_PASS_LOGIN, false);
    Get.offAll(() => LoginView());
  }

  @override
  void onInit() {
    _listeningLocation();

    super.onInit();
  }

  _listeningLocation() {
    Geolocator.getPositionStream().listen((Position position) {
      if (position.isMocked) {
        if (!Get.isDialogOpen) _showMockLocationDetectedDialog();
      } else {
        if (Get.isDialogOpen && isMocked.value) Get.back();
      }

      setIsMocked(position.isMocked);
    });
  }

  _showMockLocationDetectedDialog() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        elevation: 0,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("You're detected using mock location/fake gps... please turn it off", textAlign: TextAlign.center, style: ThemeTextStyle.biryaniRegular.apply(color: Colors.black, fontSizeDelta: 12.sp),)
          ],
        ),
      ),
      barrierDismissible: false,
    ).then((_) {
      if (commonController.isMocked.value) _showMockLocationDetectedDialog();
    });
  }
}