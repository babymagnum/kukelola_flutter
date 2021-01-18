import 'package:flutter/cupertino.dart';

class ReimbursmentDetailItem {
  ReimbursmentDetailItem(this.description, this.price);

  String description;
  int price;
}

class LeaveTypeItem {
  LeaveTypeItem(this.label);
  
  String label;
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