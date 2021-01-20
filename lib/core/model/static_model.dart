import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';

class AddEducationForms {
  String degree = '';
  String startYear = TextUtil.getCurrentDate('yyyy');
  String endYear = TextUtil.getCurrentDate('yyyy');
  String institution = '';
  String major = '';
  String score = '';
}

class EducationDataItem {
  EducationDataItem(this.title, this.jurusan, this.tahun, this.tempat);

  String title;
  String tahun;
  String tempat;
  String jurusan;
  bool loading = false;
}

class PersonalDataForm {
  String firstName = 'Arief';
  String middleName = '';
  String lastName = 'Zainuri';
  String cityOfBirth = 'Sleman';
  String dateOfBirth = '08/05/1996';
  String email = 'flaminglassoo1996@gmail.com';
  String phone = '085792810600';
  String identificationNumber = '3471120805960001';
  String gender = 'Male';
  String religion = 'Others';
  String maritalStatus = 'Married';
  String address = '';
}

class LeaveRequestForm {
  String type = '';
  String startDate = TextUtil.getCurrentDate('dd/MM/yyyy');
  String endDate = TextUtil.getCurrentDate('dd/MM/yyyy');
  String reason = '';
  File attachment = File('');
  LeaveTypeItem leaveType = LeaveTypeItem('');
  LeaveTypeItem specialLeaveType = LeaveTypeItem('');

  bool showSpecialType() => leaveType.label == 'Special Leave';
}

class ReimbursmentDetailItem {
  ReimbursmentDetailItem(this.description, this.price);

  String description;
  int price;
}

class LeaveTypeItem {
  LeaveTypeItem(this.label);
  
  String label = '';
}

class ProfileMenuItem {
  ProfileMenuItem(this.image, this.label, this.logout);

  String image;
  String label;
  bool logout;
}

class OnboardingItem {
  OnboardingItem(this.title, this.image, this.description);

  String image;
  String title;
  String description;
}

class ContainerHomeItem {
  ContainerHomeItem(this.label, this.image);

  String image;
  String label;
}

class HomeMenuItem {
  HomeMenuItem(this.label, this.image, this.color, this.count);

  String image;
  String label;
  Color color;
  int count;
}

class NotificationItem {
  NotificationItem(this.color, this.image, this.description, this.title, this.time, this.unread);

  String time;
  String title;
  String description;
  String color;
  String image;
  bool unread;
}