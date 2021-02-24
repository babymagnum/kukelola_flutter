import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerHomeController extends GetxController {
  var selectedPage = 0.obs;
  var pageController = PageController(initialPage: 0);

  setSelectedPage(int value) => selectedPage.value = value;

  @override
  void onClose() {
    pageController.dispose();

    super.onClose();
  }
}