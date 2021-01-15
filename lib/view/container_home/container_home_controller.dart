import 'package:get/get.dart';

class ContainerHomeController extends GetxController {
  var selectedPage = 0.obs;

  setSelectedPage(int value) => selectedPage.value = value;
}