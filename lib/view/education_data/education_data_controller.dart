import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';

class EducationDataController extends GetxController {
  var loadingEducation = false.obs;
  var listEducation = List<EducationDataItem>().obs;

  populateData() async {
    loadingEducation.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loadingEducation.value = false;
    var list = [
      EducationDataItem('Middle School', 'No Major - 89', '2008 - 2011', 'SMP Kebon Kacang'),
      EducationDataItem('High School', 'Social Science - 90', '2012 - 2015', 'SMA Kebon Kacang'),
      EducationDataItem('University', 'Computer Science - 3,36', '2016 - 2020', 'Harvard University'),
    ];

    list.forEach((element) => listEducation.add(element));
  }
  removeData(int index) => listEducation.removeAt(index);
  addData(EducationDataItem item) => listEducation.add(item);

  @override
  void onInit() {
    super.onInit();

    populateData();
  }

}