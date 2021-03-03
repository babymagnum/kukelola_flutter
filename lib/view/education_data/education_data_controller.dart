import 'package:get/get.dart';
import 'package:kukelola_flutter/networking/model/staff_education.dart';
import 'package:kukelola_flutter/networking/service/service.dart';

class EducationDataController extends GetxController {
  var loadingEducation = false.obs;
  var errorEducation = false.obs;
  var listEducation = List<StaffEducationData>().obs;

  populateData() async {
    loadingEducation.value = true;
    final data = await Service().staffEducation();
    loadingEducation.value = false;

    if (data?.isSuccess ?? false) {
      errorEducation.value = false;

      listEducation.clear();
      listEducation.addAll(data.data);
    } else {
      errorEducation.value = true;
    }
  }

  removeData(int index) async {
    var data = listEducation[index];
    data.loading = true;
    listEducation[index] = data;
    await Future.delayed(Duration(seconds: 1), () {});
    listEducation.removeAt(index);
  }

  addData(StaffEducationData item) => listEducation.add(item);
}