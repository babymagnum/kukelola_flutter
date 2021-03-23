import 'dart:io';
import 'package:dio/dio.dart';
import 'package:kukelola_flutter/main.dart';

class OvertimeRequest {
  String OvertimeDate;
  String StartHour;
  String EndHour;
  String Description;
  File FileSatu;

  OvertimeRequest(this.OvertimeDate, this.Description, this.StartHour, this.EndHour, this.FileSatu);

  Future<FormData> body() async {
    final form = FormData();

    form.fields
      ..add(MapEntry('UserId', homeController.userData.value.userId))
      ..add(MapEntry('ClientId', homeController.userData.value.clientId))
      ..add(MapEntry('OvertimeDate', OvertimeDate))
      ..add(MapEntry('StartHour', StartHour))
      ..add(MapEntry('EndHour', EndHour))
      ..add(MapEntry('Description', Description));

    if (FileSatu.path != '') {
      form.files..add(MapEntry('FileSatu', await MultipartFile.fromFile(FileSatu.path, filename: FileSatu.path.split('/').last)));
    }

    return form;
  }

}