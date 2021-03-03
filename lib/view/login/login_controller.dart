import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/core/widgets/dialog_error.dart';
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
    final data = await Service().token(LoginRequest(form.value.username, form.value.password, otp, commonController.autoLogin.value ? 'true' : 'false'));
    loadingLogin.value = false;

    if (data != null) {
      commonController.preferences.setString(Constant.EMAIL, form.value.username);
      commonController.preferences.setString(Constant.PASSWORD, form.value.password);
      commonController.preferences.setString(Constant.OTP, otp);
      commonController.preferences.setBool(Constant.IS_PASS_LOGIN, true);
      commonController.preferences.setString(Constant.TOKEN, data.access_token);
      Get.to(commonController.autoLogin.value ? ContainerHomeView() : VerificationCodeView());
      commonController.setAutoLogin(false);
    } else {
      Get.dialog(DialogError(error: 'Failed to login', button: 'Ok', buttonClick: () => Get.back()));
    }
  }
}