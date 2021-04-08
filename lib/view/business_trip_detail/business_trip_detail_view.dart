import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:kukelola_flutter/view/business_trip_detail/business_trip_detail_controller.dart';
import 'package:kukelola_flutter/view/business_trip_detail/widget/business_trip_detail_input.dart';

class BusinessTripDetailView extends StatefulWidget {
  @override
  _BusinessTripDetailViewState createState() => _BusinessTripDetailViewState();
}

class _BusinessTripDetailViewState extends State<BusinessTripDetailView> {

  var _businessTripDetailCt = Get.put(BusinessTripDetailController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _businessTripDetailCt.loadPreviousForm();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Column(
        children: [
          SizedBox(height: context.mediaQueryPadding.top + 24.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Obx(() => Row(
              children: [
                Expanded(
                  child: ButtonBack(
                    label: 'Business Trip',
                    onBack: () => Get.back(),
                  ),
                ),
                SizedBox(width: 10.w,),
                ButtonLoading(
                  backgroundColor: ThemeColor.primary,
                  disable: _businessTripDetailCt.loadingSubmit.value,
                  title: 'Submit',
                  loading: _businessTripDetailCt.loadingSubmit.value,
                  onTap: () => _businessTripDetailCt.submitBusinessTrip(),
                  verticalPadding: 6.h,
                  horizontalPadding: 15.w,
                  loadingSize: 12.w,
                  textStyle: ThemeTextStyle.biryaniSemiBold.apply(color: Colors.white, fontSizeDelta: 12.ssp),
                )
              ],
            ),
            ),
          ),
          Expanded(
            child: CupertinoScrollbar(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      SizedBox(height: 32.h,),
                      BusinessTripDetailInput(
                        title: 'AIRPLANE / BUS / TICKET',
                        onAmountChange: (text) {
                          _businessTripDetailCt.form.value.airplaneBusTicket.amount = text.trim().replaceAll('Rp ', '').replaceAll('.', '');
                          _businessTripDetailCt.setForm(_businessTripDetailCt.form.value);
                        },
                        onDescriptionChange: (text) {
                          _businessTripDetailCt.form.value.airplaneBusTicket.description = text.trim();
                          _businessTripDetailCt.setForm(_businessTripDetailCt.form.value);
                        },
                        amount: _businessTripDetailCt.form.value.airplaneBusTicket.amount,
                        description: _businessTripDetailCt.form.value.airplaneBusTicket.description,
                      ),
                      SizedBox(height: 24.h,),
                      BusinessTripDetailInput(
                        title: 'LOCAL TRANSPORTATION',
                        onAmountChange: (text) {
                          _businessTripDetailCt.form.value.localTransportation.amount = text.trim().replaceAll('Rp ', '').replaceAll('.', '');
                          _businessTripDetailCt.setForm(_businessTripDetailCt.form.value);
                        },
                        onDescriptionChange: (text) {
                          _businessTripDetailCt.form.value.localTransportation.description = text.trim();
                          _businessTripDetailCt.setForm(_businessTripDetailCt.form.value);
                        },
                        amount: _businessTripDetailCt.form.value.localTransportation.amount,
                        description: _businessTripDetailCt.form.value.localTransportation.description,
                      ),
                      SizedBox(height: 24.h,),
                      BusinessTripDetailInput(
                        title: 'AIRPORT TAX, PARKING, FUEL',
                        onAmountChange: (text) {
                          _businessTripDetailCt.form.value.airportParkingFuel.amount = text.trim().replaceAll('Rp ', '').replaceAll('.', '');
                          _businessTripDetailCt.setForm(_businessTripDetailCt.form.value);
                        },
                        onDescriptionChange: (text) {
                          _businessTripDetailCt.form.value.airportParkingFuel.description = text.trim();
                          _businessTripDetailCt.setForm(_businessTripDetailCt.form.value);
                        },
                        amount: _businessTripDetailCt.form.value.airportParkingFuel.amount,
                        description: _businessTripDetailCt.form.value.airportParkingFuel.description,
                      ),
                      SizedBox(height: 24.h,),
                      BusinessTripDetailInput(
                        title: 'HOUSING',
                        onAmountChange: (text) {
                          _businessTripDetailCt.form.value.housing.amount = text.trim().replaceAll('Rp ', '').replaceAll('.', '');
                          _businessTripDetailCt.setForm(_businessTripDetailCt.form.value);
                        },
                        onDescriptionChange: (text) {
                          _businessTripDetailCt.form.value.housing.description = text.trim();
                          _businessTripDetailCt.setForm(_businessTripDetailCt.form.value);
                        },
                        amount: _businessTripDetailCt.form.value.housing.amount,
                        description: _businessTripDetailCt.form.value.housing.description,
                      ),
                      SizedBox(height: 24.h,),
                      BusinessTripDetailInput(
                        title: 'MEAL',
                        onAmountChange: (text) {
                          _businessTripDetailCt.form.value.meal.amount = text.trim().replaceAll('Rp ', '').replaceAll('.', '');
                          _businessTripDetailCt.setForm(_businessTripDetailCt.form.value);
                        },
                        onDescriptionChange: (text) {
                          _businessTripDetailCt.form.value.meal.description = text.trim();
                          _businessTripDetailCt.setForm(_businessTripDetailCt.form.value);
                        },
                        amount: _businessTripDetailCt.form.value.meal.amount,
                        description: _businessTripDetailCt.form.value.meal.description,
                      ),
                      SizedBox(height: 24.h,),
                      BusinessTripDetailInput(
                        title: 'LAUNDRY',
                        onAmountChange: (text) {
                          _businessTripDetailCt.form.value.laundry.amount = text.trim().replaceAll('Rp ', '').replaceAll('.', '');
                          _businessTripDetailCt.setForm(_businessTripDetailCt.form.value);
                        },
                        onDescriptionChange: (text) {
                          _businessTripDetailCt.form.value.laundry.description = text.trim();
                          _businessTripDetailCt.setForm(_businessTripDetailCt.form.value);
                        },
                        amount: _businessTripDetailCt.form.value.laundry.amount,
                        description: _businessTripDetailCt.form.value.laundry.description,
                      ),
                      SizedBox(height: 24.h,),
                      BusinessTripDetailInput(
                        title: 'POCKET MONEY',
                        onAmountChange: (text) {
                          _businessTripDetailCt.form.value.pocketMoney.amount = text.trim().replaceAll('Rp ', '').replaceAll('.', '');
                          _businessTripDetailCt.setForm(_businessTripDetailCt.form.value);
                        },
                        onDescriptionChange: (text) {
                          _businessTripDetailCt.form.value.pocketMoney.description = text.trim();
                          _businessTripDetailCt.setForm(_businessTripDetailCt.form.value);
                        },
                        amount: _businessTripDetailCt.form.value.pocketMoney.amount,
                        description: _businessTripDetailCt.form.value.pocketMoney.description,
                      ),
                      SizedBox(height: 24.h,),
                      BusinessTripDetailInput(
                        title: 'OTHER',
                        onAmountChange: (text) {
                          _businessTripDetailCt.form.value.other.amount = text.trim().replaceAll('Rp ', '').replaceAll('.', '');
                          _businessTripDetailCt.setForm(_businessTripDetailCt.form.value);
                        },
                        onDescriptionChange: (text) {
                          _businessTripDetailCt.form.value.other.description = text.trim();
                          _businessTripDetailCt.setForm(_businessTripDetailCt.form.value);
                        },
                        amount: _businessTripDetailCt.form.value.other.amount,
                        description: _businessTripDetailCt.form.value.other.description,
                      ),
                      SizedBox(height: 32.h,)
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
