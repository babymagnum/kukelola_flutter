import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
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
      CommonFunction.standartSnackbar('Berhasil Submit: ${data?.message ?? 'Business Trip Request'}');
      _businessTripCt.setForm(BusinessTripForm());

      Future.delayed(Duration(milliseconds: 2000), () => Get.back());
    } else {
      CommonFunction.standartSnackbar('Gagal Submit: ${data?.message ?? 'Server Error!'}');
    }
  }

}