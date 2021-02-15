import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';

class BusinessTripDetailController extends GetxController {
  var loadingSubmit = false.obs;
  var form = BusinessTripDetailForm().obs;

  setForm(BusinessTripDetailForm value) => form.value = value;

  submitBusinessTrip() async {
    print('business trip detail form ${form.value.airplaneBusTicket.amount}, ${form.value.airplaneBusTicket.description}');

    loadingSubmit.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loadingSubmit.value = false;
  }

}