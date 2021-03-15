import 'package:kukelola_flutter/networking/model/standart.dart';

standartFromJson(Standart data, Map<String, dynamic> json) {
	if (json['Message'] != null) {
		data.message = json['Message'].toString();
	}
	if (json['IsSuccess'] != null) {
		data.isSuccess = json['IsSuccess'];
	}
	if (json['errorMessage'] != null) {
		data.errorMessage = json['errorMessage'].toString();
	}
	return data;
}

Map<String, dynamic> standartToJson(Standart entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Message'] = entity.message;
	data['IsSuccess'] = entity.isSuccess;
	data['errorMessage'] = entity.errorMessage;
	return data;
}