import 'package:kukelola_flutter/networking/model/file_attachment.dart';

fileAttachmentFromJson(FileAttachment data, Map<String, dynamic> json) {
	if (json['Data'] != null) {
		data.data = FileAttachmentData().fromJson(json['Data']);
	}
	if (json['Total'] != null) {
		data.total = json['Total'] is String
				? int.tryParse(json['Total'])
				: json['Total'].toInt();
	}
	if (json['Errors'] != null) {
		data.errors = (json['Errors'] as List).map((v) => v).toList().cast<dynamic>();
	}
	if (json['Message'] != null) {
		data.message = json['Message'].toString();
	}
	if (json['IsSuccess'] != null) {
		data.isSuccess = json['IsSuccess'];
	}
	if (json['IsAdmin'] != null) {
		data.isAdmin = json['IsAdmin'];
	}
	if (json['IsSuperAdmin'] != null) {
		data.isSuperAdmin = json['IsSuperAdmin'];
	}
	if (json['IsFinance'] != null) {
		data.isFinance = json['IsFinance'];
	}
	if (json['errorMessage'] != null) {
		data.errorMessage = json['errorMessage'].toString();
	}
	return data;
}

Map<String, dynamic> fileAttachmentToJson(FileAttachment entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Data'] = entity.data?.toJson();
	data['Total'] = entity.total;
	data['Errors'] = entity.errors;
	data['Message'] = entity.message;
	data['IsSuccess'] = entity.isSuccess;
	data['IsAdmin'] = entity.isAdmin;
	data['IsSuperAdmin'] = entity.isSuperAdmin;
	data['IsFinance'] = entity.isFinance;
	data['errorMessage'] = entity.errorMessage;
	return data;
}

fileAttachmentDataFromJson(FileAttachmentData data, Map<String, dynamic> json) {
	if (json['FileName'] != null) {
		data.fileName = json['FileName'].toString();
	}
	if (json['ContentType'] != null) {
		data.contentType = json['ContentType'].toString();
	}
	if (json['File'] != null) {
		data.file = json['File'].toString();
	}
	return data;
}

Map<String, dynamic> fileAttachmentDataToJson(FileAttachmentData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['FileName'] = entity.fileName;
	data['ContentType'] = entity.contentType;
	data['File'] = entity.file;
	return data;
}