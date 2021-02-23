import 'dart:io';
import 'package:dio/dio.dart';

class OvertimeRequest {
  String UserId;
  String OvertimeDate;
  String StartHour;
  String EndHour;
  String Description;
  File FileSatu;

  OvertimeRequest(this.UserId, this.OvertimeDate, this.Description, this.StartHour, this.EndHour, this.FileSatu);

  Future<FormData> body() async {
    final form = FormData();

    form.fields
      ..add(MapEntry('UserId', UserId))
      ..add(MapEntry('OvertimeDate', OvertimeDate))
      ..add(MapEntry('StartHour', StartHour))
      ..add(MapEntry('EndHour', EndHour))
      ..add(MapEntry('Description', Description));

    form.files..add(MapEntry('FileSatu', await MultipartFile.fromFile(FileSatu.path, filename: FileSatu.path.split('/').last)));

    return form;
  }

}