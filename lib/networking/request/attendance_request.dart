import 'dart:io';
import 'package:dio/dio.dart';

class AttendanceRequest {
  String UserId;
  String StartDate;
  String EndDate;
  String StartHour;
  String EndHour;
  String Description;
  File FileSatu;

  AttendanceRequest(this.UserId, this.StartDate, this.EndDate, this.Description, this.StartHour, this.EndHour, this.FileSatu);

  Future<FormData> body() async {
    final form = FormData();

    form.fields
      ..add(MapEntry('UserId', UserId))
      ..add(MapEntry('StartDate', StartDate))
      ..add(MapEntry('EndDate', EndDate))
      ..add(MapEntry('StartHour', StartHour))
      ..add(MapEntry('EndHour', EndHour))
      ..add(MapEntry('Description', Description));

    if (FileSatu.path != '') {
      form.files..add(MapEntry('FileSatu', await MultipartFile.fromFile(FileSatu.path, filename: FileSatu.path.split('/').last)));
    }

    return form;
  }

}