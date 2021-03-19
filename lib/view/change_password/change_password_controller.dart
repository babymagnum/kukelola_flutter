import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/networking/request/change_password_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';

class ChangePasswordController extends GetxController {
  var currentPasswordObsecure = true.obs;
  var newPasswordObsecure = true.obs;
  var confirmPasswordObsecure = true.obs;
  var loadingChangePassword = false.obs;
  var form = ChangePasswordForm().obs;

  setForm(ChangePasswordForm value) => form.value = value;
  setCurrentPasswordObsecure(bool value) => currentPasswordObsecure.value = value;
  setNewPasswordObsecure(bool value) => newPasswordObsecure.value = value;
  setConfirmPasswordObsecure(bool value) => confirmPasswordObsecure.value = value;

  changePassword(BuildContext context) async {
    if (!TextUtil.validatePassword(form.value.currentPassword)) {
      CommonFunction.standartSnackbar('Password tidak sesuai format.');
    } else if (!TextUtil.validatePassword(form.value.newPassword)) {
      CommonFunction.standartSnackbar('Password tidak sesuai format.');
    } else if (!TextUtil.validatePassword(form.value.confirmPassword)) {
      CommonFunction.standartSnackbar('Password tidak sesuai format.');
    } else if (form.value.newPassword != form.value.confirmPassword) {
      CommonFunction.standartSnackbar('Password baru tidak sama dengan konfirmasi password');
    } else {
      loadingChangePassword.value = true;
      final data = await Service().changePassword(ChangePasswordRequest(form.value.currentPassword, form.value.newPassword));
      loadingChangePassword.value = false;

      if (data?.isSuccess ?? false) {
        CommonFunction.standartSnackbar('Berhasil Mengubah Password');
      } else {
        CommonFunction.standartSnackbar('Gagal Mengubah Password: ${data?.message ?? 'Server Error!'}');
      }
    }
  }
}