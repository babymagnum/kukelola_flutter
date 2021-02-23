import 'dart:io';
import 'package:dio/dio.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';

class ReimbursmentRequest {
  String UserId;
  String Description;
  File FileSatu;
  List<ReimbursmentDetailItem> listDetail = [];

  ReimbursmentRequest(this.UserId, this.Description, this.FileSatu, this.listDetail);

  Future<FormData> body() async {
    final form = FormData();

    form.fields
      ..add(MapEntry('UserId', UserId))
      ..add(MapEntry('Description', Description));

    if (listDetail.length > 0) {
      for (int i=0; i<listDetail.length; i++) {
        form.fields
          ..add(MapEntry('[$i].ItemDescription', listDetail[i].description))
          ..add(MapEntry('[$i].ItemCost', listDetail[i].cost));
      }
    }

    form.files..add(MapEntry('FileSatu', await MultipartFile.fromFile(FileSatu.path, filename: FileSatu.path.split('/').last)));

    return form;
  }

}