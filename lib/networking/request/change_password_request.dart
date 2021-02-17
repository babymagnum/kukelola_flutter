import 'package:dio/dio.dart';

class ChangePasswordRequest {
  String OldPassword;
  String NewPassword;

  ChangePasswordRequest(this.OldPassword, this.NewPassword);

  FormData body() {
    final form = FormData();

    form.fields
      ..add(MapEntry('OldPassword', OldPassword))
      ..add(MapEntry('NewPassword', NewPassword));

    return form;
  }
}