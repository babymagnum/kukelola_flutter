import 'package:kukelola_flutter/main.dart';

class AttendanceOnlineRequest {
  String AttendanceDate;
  String AttendanceTime;
  int AttendanceType;
  double Longitude;
  double Latitude;

  AttendanceOnlineRequest(this.AttendanceDate, this.AttendanceTime, this.AttendanceType, this.Latitude, this.Longitude);

  dynamic getBody() {
    return {
      "AttendanceDate": AttendanceDate,
      "AttendanceTime": AttendanceTime,
      "AttendanceType": AttendanceType,
      "Longitude": Longitude,
      "Latitude": Latitude,
      "UserId": homeController.userData.value.userId
    };
  }
}