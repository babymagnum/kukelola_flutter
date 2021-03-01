import 'dart:io';

import 'package:dio/dio.dart';

class BusinessTripRequest {
  String UserId;
  String StartDate;
  String EndDate;
  String Purpose;
  String Destination;
  String TransportAmount;
  String TransportDescription;
  String LocalTransportAmount;
  String LocalTransportDescription;
  String ParkingAmount;
  String ParkingDescription;
  String HousingAmount;
  String HousingDescription;
  String MealAmount;
  String MealDescription;
  String LaundryAmount;
  String LaundryDescription;
  String PocketMoneyAmount;
  String PocketMoneyDescription;
  String OtherAmount;
  String OtherDescription;
  File FileOne;

  BusinessTripRequest(this.UserId, this.StartDate, this.EndDate, this.Purpose, this.Destination, this.TransportAmount, this.TransportDescription, this.LocalTransportAmount,
      this.LocalTransportDescription, this.ParkingAmount, this.ParkingDescription, this.HousingAmount, this.HousingDescription, this.MealAmount, this.MealDescription,
      this.LaundryAmount, this.LaundryDescription, this.PocketMoneyAmount, this.PocketMoneyDescription, this.OtherAmount, this.OtherDescription, this.FileOne);

  Future<FormData> getBody() async {
    final form = FormData();

    form.fields
      ..add(MapEntry('UserId', UserId))
      ..add(MapEntry('StartDate', StartDate))
      ..add(MapEntry('EndDate', EndDate))
      ..add(MapEntry('Purpose', Purpose))
      ..add(MapEntry('Destination', Destination))
      ..add(MapEntry('TransportAmount', TransportAmount))
      ..add(MapEntry('TransportDescription', TransportDescription))
      ..add(MapEntry('LocalTransportAmount', LocalTransportAmount))
      ..add(MapEntry('LocalTransportDescription', LocalTransportDescription))
      ..add(MapEntry('ParkingAmount', ParkingAmount))
      ..add(MapEntry('ParkingDescription', ParkingDescription))
      ..add(MapEntry('HousingAmount', HousingAmount))
      ..add(MapEntry('HousingDescription', HousingDescription))
      ..add(MapEntry('MealAmount', MealAmount))
      ..add(MapEntry('MealDescription', MealDescription))
      ..add(MapEntry('LaundryAmount', LaundryAmount))
      ..add(MapEntry('LaundryDescription', LaundryDescription))
      ..add(MapEntry('PocketMoneyAmount', PocketMoneyAmount))
      ..add(MapEntry('PocketMoneyDescription', PocketMoneyDescription))
      ..add(MapEntry('OtherAmount', OtherAmount))
      ..add(MapEntry('OtherDescription', OtherDescription));

    form.files..add(MapEntry('FileOne', await MultipartFile.fromFile(FileOne.path, filename: FileOne.path.split('/').last)));

    return form;
  }
}