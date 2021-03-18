import 'dart:io';
import 'package:dio/dio.dart';

class AttendanceRequest {
  String UserId;
  String StartDate;
  String EndDate;
  String StartHour;
  String EndHour;
  String Description;
  List<File> listFile;

  AttendanceRequest(this.UserId, this.StartDate, this.EndDate, this.Description, this.StartHour, this.EndHour, this.listFile);

  Future<FormData> body() async {
    final form = FormData();

    form.fields
      ..add(MapEntry('UserId', UserId))
      ..add(MapEntry('StartDate', StartDate))
      ..add(MapEntry('EndDate', EndDate))
      ..add(MapEntry('StartHour', StartHour))
      ..add(MapEntry('EndHour', EndHour))
      ..add(MapEntry('Description', Description));

    if (listFile.length > 0) {
      // for (int i=0; i<listFile.length; i++) {
      //   form.files..add(MapEntry('File$i', await MultipartFile.fromFile(listFile[i].path, filename: listFile[i].path.split('/').last)));
      // }

      form.files..add(MapEntry('FileSatu', await MultipartFile.fromFile(listFile[0].path, filename: listFile[0].path.split('/').last)));
    }

    return form;
  }

}