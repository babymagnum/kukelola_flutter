import 'dart:io';
import 'package:dio/dio.dart';

class ProfilePictureRequest {
  dynamic Cords;
  File Gambar;

  ProfilePictureRequest(this.Cords, this.Gambar);

  Future<FormData> body() async {
    final form = FormData();

    form.fields
      ..add(MapEntry('Cords', Cords.toString()));

    form.files..add(MapEntry('Gambar', await MultipartFile.fromFile(Gambar.path, filename: Gambar.path.split('/').last)));

    return form;
  }

}