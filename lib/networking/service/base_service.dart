import 'package:dio/dio.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/generated/json/corporate_calendar_helper.dart';
import 'package:kukelola_flutter/generated/json/leave_summary_grid_helper.dart';
import 'package:kukelola_flutter/generated/json/overtime_request_post_helper.dart';
import 'package:kukelola_flutter/generated/json/overtime_summary_grid_helper.dart';
import 'package:kukelola_flutter/generated/json/payslip_helper.dart';
import 'package:kukelola_flutter/generated/json/special_leave_list_helper.dart';
import 'package:kukelola_flutter/generated/json/staff_education_helper.dart';
import 'package:kukelola_flutter/generated/json/staff_education_insert_helper.dart';
import 'package:kukelola_flutter/generated/json/staff_experience_helper.dart';
import 'package:kukelola_flutter/generated/json/staff_experience_insert_helper.dart';
import 'package:kukelola_flutter/generated/json/staff_family_helper.dart';
import 'package:kukelola_flutter/generated/json/staff_family_insert_helper.dart';
import 'package:kukelola_flutter/generated/json/staff_helper.dart';
import 'package:kukelola_flutter/generated/json/standart_helper.dart';
import 'package:kukelola_flutter/generated/json/token_helper.dart';
import 'package:kukelola_flutter/generated/json/user_helper.dart';
import 'package:kukelola_flutter/generated/json/workflow_grid_helper.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/model/corporate_calendar.dart';
import 'package:kukelola_flutter/networking/model/leave_summary_grid.dart';
import 'package:kukelola_flutter/networking/model/overtime_request_post.dart';
import 'package:kukelola_flutter/networking/model/overtime_summary_grid.dart';
import 'package:kukelola_flutter/networking/model/payslip.dart';
import 'package:kukelola_flutter/networking/model/special_leave_list.dart';
import 'package:kukelola_flutter/networking/model/staff.dart';
import 'package:kukelola_flutter/networking/model/staff_education.dart';
import 'package:kukelola_flutter/networking/model/staff_education_insert.dart';
import 'package:kukelola_flutter/networking/model/staff_experience.dart';
import 'package:kukelola_flutter/networking/model/staff_experience_insert.dart';
import 'package:kukelola_flutter/networking/model/staff_family.dart';
import 'package:kukelola_flutter/networking/model/staff_family_insert.dart';
import 'package:kukelola_flutter/networking/model/standart.dart';
import 'package:kukelola_flutter/networking/model/token.dart';
import 'package:kukelola_flutter/networking/model/user.dart';
import 'dart:convert';

import 'package:kukelola_flutter/networking/model/workflow_grid.dart';

class BaseService {

  Map<String, String> getHeaders() {
    var maps = Map<String, String>();
    maps['authorization'] = 'Bearer ${commonController.preferences.getString(Constant.TOKEN)}';
    return maps;
  }

  // TODO: POST WITH FORM DATA
  Future<T> postFormData<T>(String url, FormData body) async {
    T resultResponse;

    try {
      final dio = Dio();
      dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
      var response = await dio.post(url, data: body, options: Options(headers: getHeaders()));

      if (response.isRedirect) {
        commonController.standartLogout();
      } else {
        var responseMap = jsonDecode(response.toString());
        resultResponse = fromJson<T>(responseMap);
      }
    } on DioError catch (e) {
      var responseMap = jsonDecode(e.response.toString());
      resultResponse = fromJson<T>(responseMap);
    }

    return resultResponse;
  }

  // TODO: POST
  Future<T> postUrlEncoded<T>(String url, dynamic body) async {
    T resultResponse;

    try {
      final dio = Dio();
      dio.options.contentType = Headers.formUrlEncodedContentType;
      dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
      var response = await dio.post(url, data: body,
          options: Options(contentType: Headers.formUrlEncodedContentType));

      if (response.isRedirect) {
        commonController.standartLogout();
      } else {
        var responseMap = jsonDecode(response.toString());
        resultResponse = fromJson<T>(responseMap);
      }
    } on DioError catch (e) {
      var responseMap = jsonDecode(e.response.toString());
      resultResponse = fromJson<T>(responseMap);
    }
    return resultResponse;
  }

  // TODO: POST
  Future<T> post<T>(String url) async {
    T resultResponse;

    try {
      final dio = Dio();
      dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
      var response = await dio.post(url, options: Options(headers: getHeaders()));

      if (response.isRedirect) {
        commonController.standartLogout();
      } else {
        var responseMap = jsonDecode(response.toString());
        resultResponse = fromJson<T>(responseMap);
      }
    } on DioError catch (e) {
      var responseMap = jsonDecode(e.response.toString());
      resultResponse = fromJson<T>(responseMap);
    }
    return resultResponse;
  }

  // TODO: POST WITH JSON BODY
  Future<T> postJsonBody<T>(String url, dynamic body) async {
    T resultResponse;

    try {
      final dio = Dio();
      dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
      var response = await dio.post(url, data: body, options: Options(headers: getHeaders()));

      if (response.isRedirect) {
        commonController.standartLogout();
      } else {
        var responseMap = jsonDecode(response.toString());
        resultResponse = fromJson<T>(responseMap);
      }
    } on DioError catch (e) {
      var responseMap = jsonDecode(e.response.toString());
      resultResponse = fromJson<T>(responseMap);
    }

    return resultResponse;

  }

  // TODO: GET
  Future<T> get<T>(String url) async {
    T resultResponse;

    try {
      final dio = Dio();
      dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
      var response = await dio.get(url, options: Options(headers: getHeaders()));

      if (response.isRedirect) {
        commonController.standartLogout();
      } else {
        var responseMap = jsonDecode(response.toString());
        resultResponse = fromJson<T>(responseMap);
      }
    } on DioError catch (e) {
      var responseMap = jsonDecode(e.response.toString());
      resultResponse = fromJson<T>(responseMap);
    }

    return resultResponse;
  }

  // TODO: PUT
  Future<T> putJsonBody<T>(String url, dynamic body) async {
    T resultResponse;

    try {
      final dio = Dio();
      dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
      var response = await dio.put(url, data: body, options: Options(headers: getHeaders()));

      if (response.isRedirect) {
        commonController.standartLogout();
      } else {
        var responseMap = jsonDecode(response.toString());
        resultResponse = fromJson<T>(responseMap);
      }
    } on DioError catch (e) {
      var responseMap = jsonDecode(e.response.toString());
      resultResponse = fromJson<T>(responseMap);
    }

    return resultResponse;
  }

  // TODO: DELETE
  Future<T> delete<T>(String url) async {
    T resultResponse;

    try {
      final dio = Dio();
      dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
      var response = await dio.delete(url, options: Options(headers: getHeaders()));

      if (response.isRedirect) {
        commonController.standartLogout();
      } else {
        var responseMap = jsonDecode(response.toString());
        resultResponse = fromJson<T>(responseMap);
      }
    } on DioError catch (e) {
      var responseMap = jsonDecode(e.response.toString());
      resultResponse = fromJson<T>(responseMap);
    }

    return resultResponse;
  }

  // TODO: Converter json to dart object
  static T fromJson<T>(dynamic json) {
    if (json is Iterable) {
      return _fromJsonList<T>(json) as T;
    } else if (T == Token) {
      return tokenFromJson(Token(), json) as T;
    } else if (T == User) {
      return userFromJson(User(), json) as T;
    } else if (T == OvertimeRequestPost) {
      return overtimeRequestPostFromJson(OvertimeRequestPost(), json) as T;
    } else if (T == SpecialLeaveList) {
      return specialLeaveListFromJson(SpecialLeaveList(), json) as T;
    } else if (T == Standart) {
      return standartFromJson(Standart(), json) as T;
    } else if (T == CorporateCalendar) {
      return corporateCalendarFromJson(CorporateCalendar(), json) as T;
    } else if (T == Staff) {
      return staffFromJson(Staff(), json) as T;
    } else if (T == StaffEducation) {
      return staffEducationFromJson(StaffEducation(), json) as T;
    } else if (T == StaffExperience) {
      return staffExperienceFromJson(StaffExperience(), json) as T;
    } else if (T == StaffFamily) {
      return staffFamilyFromJson(StaffFamily(), json) as T;
    } else if (T == StaffFamilyInsert) {
      return staffFamilyInsertFromJson(StaffFamilyInsert(), json) as T;
    } else if (T == StaffExperienceInsert) {
      return staffExperienceInsertFromJson(StaffExperienceInsert(), json) as T;
    } else if (T == WorkflowGrid) {
      return workflowGridFromJson(WorkflowGrid(), json) as T;
    } else if (T == Payslip) {
      return payslipFromJson(Payslip(), json) as T;
    } else if (T == StaffEducationInsert) {
      return staffEducationInsertFromJson(StaffEducationInsert(), json) as T;
    } else if (T == LeaveSummaryGrid) {
      return leaveSummaryGridFromJson(LeaveSummaryGrid(), json) as T;
    } else if (T == OvertimeSummaryGrid) {
      return overtimeSummaryGridFromJson(OvertimeSummaryGrid(), json) as T;
    } else {
      // if this print statement occured, this means that you're not register the model class in here
      print('Unknown class, dont forget to add your model in BaseService.dart to parse the json');
      throw Exception('Unknown class');
    }
  }

  //from json list
  static List<T> _fromJsonList<T>(List jsonList) {

    if (jsonList == null) {
      return null;
    }

    List<T> output = List();

    for (Map<String, dynamic> json in jsonList) {
      output.add(fromJson(json));
    }

    return output;
  }
}
