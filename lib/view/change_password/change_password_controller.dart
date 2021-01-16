import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  var currentPasswordObsecure = true.obs;
  var newPasswordObsecure = true.obs;
  var confirmPasswordObsecure = true.obs;
  var loadingChangePassword = false.obs;

  setCurrentPasswordObsecure(bool value) => currentPasswordObsecure.value = value;
  setNewPasswordObsecure(bool value) => newPasswordObsecure.value = value;
  setConfirmPasswordObsecure(bool value) => confirmPasswordObsecure.value = value;

  changePassword(BuildContext context) async {
    loadingChangePassword.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loadingChangePassword.value = false;
  }
}