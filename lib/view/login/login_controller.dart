import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/request/login_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';
import 'package:kukelola_flutter/view/container_home/container_home_view.dart';
import 'package:kukelola_flutter/view/verification_code/verification_code_view.dart';

class LoginController extends GetxController {
  var obsecure = true.obs;
  var loadingLogin = false.obs;
  var form = LoginForm().obs;

  setObsecure(bool value) => obsecure.value = value;
  setForm(LoginForm value) => form.value = value;

  String _random4Digit() {
    return '${TextUtil.randomInt(0, 9)}${TextUtil.randomInt(0, 9)}${TextUtil.randomInt(0, 9)}${TextUtil.randomInt(0, 9)}';
  }

  login() async {
    var otp = _random4Digit();
    loadingLogin.value = true;
    print('Current time hit api token ${TextUtil.getCurrentDate('dd-MMMM-yyyy HH:mm:ss')}');
    final data = await Service().token(LoginRequest(form.value.username, form.value.password, otp, commonController.autoLogin.value ? 'true' : 'false'));
    loadingLogin.value = false;

    if (data?.accessToken != null) {
      await commonController.preferences.setString(Constant.EMAIL, form.value.username);
      await commonController.preferences.setString(Constant.PASSWORD, form.value.password);
      await commonController.preferences.setBool(Constant.IS_PASS_LOGIN, true);
      await commonController.preferences.setString(Constant.OTP, otp);
      await commonController.preferences.setString(Constant.TOKEN, data.accessToken);
      Get.to(commonController.autoLogin.value ? ContainerHomeView() : VerificationCodeView());

      if (commonController.autoLogin.value) await commonController.preferences.setBool(Constant.IS_LOGIN, true);

      commonController.setAutoLogin(false);
    } else {
      CommonFunction.standartSnackbar(data.errorDescription ?? data.errorMessage);
    }
  }
}