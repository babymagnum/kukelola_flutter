import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';

class FamiliesController extends GetxController {
  var loadingFamilies = false.obs;
  var listFamilies = List<FamiliesItem>().obs;

  populateData() async {
    loadingFamilies.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loadingFamilies.value = false;
  }

  removeData(int index) async {
    var data = listFamilies[index];
    data.loading = true;
    listFamilies[index] = data;
    await Future.delayed(Duration(seconds: 1), () {});
    listFamilies.removeAt(index);
  }

  addData(FamiliesItem item) => listFamilies.add(item);

}