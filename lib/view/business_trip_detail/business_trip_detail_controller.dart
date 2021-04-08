import 'dart:convert';

import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/request/business_trip_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';
import 'package:kukelola_flutter/view/business_trip/business_trip_controller.dart';

class BusinessTripDetailController extends GetxController {
  var _businessTripCt = Get.find<BusinessTripController>();
  var loadingSubmit = false.obs;
  var form = BusinessTripDetailForm().obs;

  setForm(BusinessTripDetailForm value) => form.value = value;

  loadPreviousForm() {
    if ((commonController.preferences.getString(Constant.BUSINESS_TRIP_DETAIL_REQUEST) ?? '') == '') return;

    Map json = jsonDecode(commonController.preferences.getString(Constant.BUSINESS_TRIP_DETAIL_REQUEST));
    var data = BusinessTripDetailForm().fromJson(json) as BusinessTripDetailForm;
    form.value = data;
  }

  submitBusinessTrip() async {
    final tripData = _businessTripCt.form.value;

    loadingSubmit.value = true;
    final data = await Service().businessTripRequest(BusinessTripRequest(homeController.userData.value.userId, tripData.startDate,
        tripData.endDate, tripData.purpose, tripData.destination, form.value.airplaneBusTicket.amount,
        form.value.airplaneBusTicket.description, form.value.localTransportation.amount,
        form.value.localTransportation.description, form.value.airportParkingFuel.amount,
        form.value.airplaneBusTicket.description, form.value.housing.amount,
        form.value.housing.description, form.value.meal.amount, form.value.meal.description,
        form.value.laundry.amount, form.value.laundry.description, form.value.pocketMoney.amount,
        form.value.pocketMoney.description, form.value.other.amount, form.value.other.description,
        tripData.attachment));
    loadingSubmit.value = false;

    if (data?.isSuccess ?? false) {
      await commonController.preferences.setString(Constant.BUSINESS_TRIP_DETAIL_REQUEST, '');
      CommonFunction.standartSnackbar('Berhasil Submit: ${data?.message ?? 'Business Trip Request'}');
      _businessTripCt.setForm(BusinessTripForm());
      setForm(BusinessTripDetailForm());
    } else {
      String jsonForm = jsonEncode(BusinessTripDetailForm().fromJson(form.value.toJson()));
      await commonController.preferences.setString(Constant.BUSINESS_TRIP_DETAIL_REQUEST, jsonForm);
      CommonFunction.standartSnackbar('Gagal Submit: ${data?.message != null ? data.message : data.errors.length > 0 ? data.errors[0].toString() : 'Server Error'}');
    }
  }

}