import 'dart:convert';
import 'package:intl/intl.dart';

abstract class TextUtil {
  static bool validateName(String text) {
    return text
        .contains(new RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"));
  }

  static bool validateNumber(String text) {
    Pattern pattern = r'^[0-9]+$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(text);
  }

  static bool validateEmail(String text) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(text);
  }

  static bool isImageFromInternet(String text) {
    Pattern pattern = 'http|https|www';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(text);
  }

  static bool validatePassword(String text) {
    return text.toString().length >= 6;
  }

  static String convertMapToString(Map<dynamic, dynamic> data) {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    return encoder.convert(data);
  }

  static String capitalize(String value) {
    return (value.length > 0)
        ? value[0].toUpperCase() + value.substring(1)
        : value[0].toUpperCase();
  }

  static String toRupiah(int value, bool noRp) {
    return "${noRp ? '' : 'Rp '}${value.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}";
  }

  static String convertDateStringToAnotherFormat(String dateString, String pattern, String originPattern) {
    DateFormat originFormat = DateFormat(originPattern);
    DateFormat finalFormat = DateFormat(pattern);
    DateTime dateTime = originFormat.parse(dateString);
    return finalFormat.format(dateTime);
  }

  static String getCurrentDate(String pattern) {
    return DateFormat(pattern).format(DateTime.now());
  }

  static String millisToStringDate(int millis, String pattern) {
    var date = DateTime.fromMillisecondsSinceEpoch(millis);
    return DateFormat(pattern).format(date);
  }
}
