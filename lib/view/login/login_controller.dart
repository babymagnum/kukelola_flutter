import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/core/widgets/dialog_error.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/service/service.dart';
import 'package:kukelola_flutter/view/container_home/container_home_view.dart';

class LoginController extends GetxController {
  var obsecure = true.obs;
  var loadingLogin = false.obs;
  var form = LoginForm().obs;

  setObsecure(bool value) => obsecure.value = value;
  setForm(LoginForm value) => form.value = value;

  login() async {
    loadingLogin.value = true;
    final data = await Service().token('?grant_type=password&username=${form.value.username}&password=${form.value.password}');
    loadingLogin.value = false;

    if (data != null) {
      commonController.preferences.setString(Constant.TOKEN, data.access_token);
      Get.to(ContainerHomeView());
    } else {
      Get.dialog(DialogError(error: 'Failed to login', button: 'Ok', buttonClick: () => Get.back()));
    }
  }
}