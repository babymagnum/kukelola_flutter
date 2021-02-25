import 'dart:io';
import 'package:dio/dio.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/generated/json/overtime_request_post_helper.dart';
import 'package:kukelola_flutter/generated/json/user_helper.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/model/Standart.dart';
import 'package:kukelola_flutter/networking/model/overtime_request_post.dart';
import 'package:kukelola_flutter/networking/model/token.dart';
import 'package:kukelola_flutter/networking/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class BaseService {

  Future<Map<String, String>> getHeaders() async {
    var prefs = await SharedPreferences.getInstance();
    var maps = Map<String, String>();
    maps['authorization'] = 'Bearer ${prefs.getString(Constant.TOKEN)}';
    return maps;
  }

  // TODO: POST WITH FORM DATA
  Future<T> postFormData<T>(String url, FormData body) async {
    T resultResponse;

    try {
      final dio = Dio();
      dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
      var response = await dio.post(url, data: body, options: Options(headers: await getHeaders()));
      var responseMap = jsonDecode(response.toString());
      resultResponse = fromJson<T>(responseMap);
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
          options: Options(contentType: Headers.formUrlEncodedContentType, headers: await getHeaders()));
      var responseMap = jsonDecode(response.toString());
      resultResponse = fromJson<T>(responseMap);
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
      var response = await dio.post(url, options: Options(headers: await getHeaders()));
      var responseMap = jsonDecode(response.toString());
      resultResponse = fromJson<T>(responseMap);
    } on DioError catch (e) {
      var responseMap = jsonDecode(e.response.toString());
      resultResponse = fromJson<T>(responseMap);
    }
    return resultResponse;
  }

  // TODO: POST WITH JSON BODY
  Future<T> postJsonBody<T>(String url, dynamic body, Map<String, dynamic> customHeaders) async {
    T resultResponse;

    try {
      final dio = Dio();
      dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
      var response = await dio.post(url, data: body, options: Options(headers: await getHeaders()));
      var responseMap = jsonDecode(response.toString());
      resultResponse = fromJson<T>(responseMap);
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
      var response = await dio.get(url, options: Options(headers: await getHeaders()));
      // dio.options.headers[HttpHeaders.authorizationHeader] = "Bearer ${commonController.preferences.getString(Constant.TOKEN)}";
      // var response = await dio.get(url);
      var responseMap = jsonDecode(response.toString());
      resultResponse = fromJson<T>(responseMap);
    } on DioError catch (e) {
      var responseMap = jsonDecode(e.response.toString());
      resultResponse = fromJson<T>(responseMap);
    }

    return resultResponse;
  }

  // TODO: PUT
  Future<T> put<T>(String url) async {
    T resultResponse;

    try {
      final dio = Dio();
      dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
      var response = await dio.put(url, options: Options(headers: await getHeaders()));
      var responseMap = jsonDecode(response.toString());
      resultResponse = fromJson<T>(responseMap);
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
      var response = await dio.delete(url, options: Options(headers: await getHeaders()));
      var responseMap = jsonDecode(response.toString());
      resultResponse = fromJson<T>(responseMap);
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
      return Token.fromJson(json) as T;
    } else if (T == User) {
      return userFromJson(User(), json) as T;
    } else if (T == OvertimeRequestPost) {
      return overtimeRequestPostFromJson(OvertimeRequestPost(), json) as T;
    } else if (T == Standart) {
      return Standart.fromJson(json) as T;
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
