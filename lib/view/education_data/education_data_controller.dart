import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';

class EducationDataController extends GetxController {
  var loadingEducation = false.obs;
  var listEducation = List<EducationDataItem>().obs;

  populateData() async {
    loadingEducation.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loadingEducation.value = false;
  }

  removeData(int index) async {
    var data = listEducation[index];
    data.loading = true;
    listEducation[index] = data;
    await Future.delayed(Duration(seconds: 1), () {});
    listEducation.removeAt(index);
  }

  addData(EducationDataItem item) => listEducation.add(item);

}