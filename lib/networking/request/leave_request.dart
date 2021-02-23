import 'dart:io';
import 'package:dio/dio.dart';

class LeaveRequest {
  String UserId;
  String StartDate;
  String EndDate;
  String Description;
  String LeaveType;
  String SpecialLeaveId;
  File FileOne;

  LeaveRequest(this.UserId, this.StartDate, this.Description, this.EndDate, this.FileOne, this.LeaveType);

  Future<FormData> body() async {
    final form = FormData();

    form.fields
      ..add(MapEntry('UserId', UserId))
      ..add(MapEntry('StartDate', StartDate))
      ..add(MapEntry('EndDate', EndDate))
      ..add(MapEntry('Description', Description))
      ..add(MapEntry('LeaveType', LeaveType));

    if (SpecialLeaveId != null) form.fields..add(MapEntry('SpecialLeaveId', SpecialLeaveId));

    form.files..add(MapEntry('FileOne', await MultipartFile.fromFile(FileOne.path, filename: FileOne.path.split('/').last)));

    return form;
  }

}