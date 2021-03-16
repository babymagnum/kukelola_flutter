import 'dart:math';
import 'package:intl/intl.dart';
import 'package:kukelola_flutter/main.dart';

class TextUtil {
  static bool validateName(String text) {
    return text.contains(RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"));
  }

  static bool validateNumber(String text) {
    Pattern pattern = r'^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(text);
  }

  static bool validatePassword(String value) {
    /*
    r'^
    (?=.*[A-Z]) // should contain at least one upper case
    (?=.*[a-z]) // should contain at least one lower case
    (?=.*?[0-9]) // should contain at least one digit
    (?=.*?[!@#\$&*~]).{8,} // should contain at least one Special character
    $
    */
    Pattern pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static bool validateEmail(String text) {
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(text);
  }

  static String capitalize(String value) {
    return (value.length > 0)
        ? value[0].toUpperCase() + value.substring(1)
        : value[0].toUpperCase();
  }

  static String toRupiah(String symbol, int value, bool noRp) {
    return '${noRp ? '' : 'Rp '}${value.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}${symbol == null ? '.' : symbol}')}';
  }

  static String standartDateFormat(String dateString, String pattern) {
    if (dateString == '') return '-';

    DateFormat originFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss", commonController.language.value);
    DateFormat finalFormat = DateFormat(pattern, commonController.language.value);
    DateTime dateTime = originFormat.parse(dateString);
    return finalFormat.format(dateTime);
  }

  static String stringToStandartDateFormat(String dateString, String pattern) {
    DateFormat originFormat = DateFormat(pattern, commonController.language.value);
    DateFormat finalFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss", commonController.language.value);
    DateTime dateTime = originFormat.parse(dateString);
    return finalFormat.format(dateTime);
  }

  static int standartDateFormatToMillis(String dateString, String pattern) {
    // DateFormat originFormat = DateFormat(pattern, commonController.language.value);
    DateFormat originFormat = DateFormat(pattern);
    return originFormat.parse(dateString).millisecondsSinceEpoch;
  }

  static DateTime convertStringToDateTime(String date, String pattern) {
    DateFormat dateFormat = DateFormat(pattern, commonController.language.value);
    return dateFormat.parse(date);
  }

  static int differenceDate(String date1, String date2, String pattern) {
    final dateTime1 = convertStringToDateTime(date1, pattern);
    final dateTime2 = convertStringToDateTime(date2, pattern);
    return dateTime1.difference(dateTime2).inDays;
  }

  static DateTime convertToAnotherDateTime(DateTime date, String pattern) {
    final stringDate = dateTimeToString(date, pattern);
    return convertStringToDateTime(stringDate, pattern);
  }

  static String convertDateStringToAnotherFormat(String dateString, String pattern, String originPattern) {
    DateFormat originFormat = DateFormat(originPattern, commonController.language.value);
    DateFormat finalFormat = DateFormat(pattern, commonController.language.value);
    DateTime dateTime = originFormat.parse(dateString);
    return finalFormat.format(dateTime);
  }

  static String getCurrentDate(String pattern) {
    return DateFormat(pattern, commonController.language.value).format(DateTime.now());
  }

  static String getCurrentStandartDate() {
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss", commonController.language.value).format(DateTime.now());
  }

  static String millisToStringDate(int millis, String pattern) {
    var date = DateTime.fromMillisecondsSinceEpoch(millis);
    return DateFormat(pattern, commonController.language.value).format(date);
  }

  static String dateTimeToString(DateTime dateTime, String pattern) {
    final DateFormat formatter = DateFormat(pattern, commonController.language.value);
    return formatter.format(dateTime);
  }

  static String shortenedNumber(String text) {
    if (text.length <= 6) {
      // ribuan
    } else if (text.length <= 9) {
      // jutaan
    } else if (text.length <= 12) {
      // milyaran
    } else if (text.length <= 15) {
      // trilyunan
    }
  }

  static int randomInt(int min, int max) => min + Random().nextInt(max - min);

  /*
  * to remove all char between two char is write that 2 char and place .*? in midle of those 2 char
  */
  static String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<.*?>|&.*?;", multiLine: true, caseSensitive: false);

    return htmlText.replaceAll(exp, '');
  }

  static bool containsHtml(String text) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return text.contains(exp);
  }
}
