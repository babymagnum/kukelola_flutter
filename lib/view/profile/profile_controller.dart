import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/request/profile_picture_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';

class ProfileController extends GetxController {
  var loadingProfileFoto = false.obs;

  var listProfileMenu = [
    ProfileMenuItem('assets/images/profile_personal_data 1.png', 'Personal Data', false),
    ProfileMenuItem('assets/images/profile_education_data 2.png', 'Education Data', false),
    ProfileMenuItem('assets/images/profile_family_data 1.png', 'Family Data', false),
    ProfileMenuItem('assets/images/profile_working_exp 1.png', 'Working Experience', false),
    ProfileMenuItem('assets/images/profile_change_pass 1.png', 'Change Password', false),
    ProfileMenuItem('assets/images/fa-solid_sign-out-alt.png', 'Logout', true),
  ];

  setLoadingProfileFoto(bool value) => loadingProfileFoto.value = value;

  setProfileFoto(File value) async {
    var decodedImage = await decodeImageFromList(value.readAsBytesSync());

    loadingProfileFoto.value = true;
    final data = await Service().profilePicture(ProfilePictureRequest({
      'x': 0,
      'y': 0,
      'width': decodedImage.width,
      'height': decodedImage.height
    }, value));
    loadingProfileFoto.value = false;

    if (data?.isSuccess ?? false) {
      homeController.getProfilePicture();
      CommonFunction.standartSnackbar('Berhasil Memperbarui Profile Picture');
    } else {
      CommonFunction.standartSnackbar('Gagal Memperbarui: ${data?.message != null ? data.message : data.errors.length > 0 ? data.errors[0].toString() : 'Server Error'}');
    }
  }

  image(String data) async {
    final decoded = utf8.encode(data);
    print('list byte $decoded');
    // final codec = await instantiateImageCodec(decoded);
    // final frameInfo = await codec.getNextFrame();
  }
}