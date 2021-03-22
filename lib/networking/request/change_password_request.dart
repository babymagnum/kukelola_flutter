import 'package:kukelola_flutter/main.dart';

class ChangePasswordRequest {
  String OldPassword;
  String NewPassword;

  ChangePasswordRequest(this.OldPassword, this.NewPassword);

  dynamic body() {
    return {
      'OldPassword': OldPassword,
      'NewPassword': NewPassword,
      'Id': homeController.userData.value.userId
    };
  }
}