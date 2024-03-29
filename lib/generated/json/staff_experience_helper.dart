import 'package:kukelola_flutter/networking/model/staff_experience.dart';

staffExperienceFromJson(StaffExperience data, Map<String, dynamic> json) {
	if (json['Data'] != null) {
		data.data = (json['Data'] as List).map((v) => StaffExperienceData().fromJson(v)).toList();
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

Map<String, dynamic> staffExperienceToJson(StaffExperience entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Data'] =  entity.data?.map((v) => v.toJson())?.toList();
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

staffExperienceDataFromJson(StaffExperienceData data, Map<String, dynamic> json) {
	if (json['Id'] != null) {
		data.id = json['Id'].toString();
	}
	if (json['Name'] != null) {
		data.name = json['Name'].toString();
	}
	if (json['Description'] != null) {
		data.description = json['Description'].toString();
	}
	if (json['LastPosition'] != null) {
		data.lastPosition = json['LastPosition'].toString();
	}
	if (json['Company'] != null) {
		data.company = json['Company'].toString();
	}
	if (json['Location'] != null) {
		data.location = json['Location'].toString();
	}
	if (json['EndYear'] != null) {
		data.endYear = json['EndYear'].toString();
	}
	if (json['Duration'] != null) {
		data.duration = json['Duration'].toString();
	}
	if (json['StaffId'] != null) {
		data.staffId = json['StaffId'].toString();
	}
	if (json['loading'] != null) {
		data.loading = json['loading'];
	}
	return data;
}

Map<String, dynamic> staffExperienceDataToJson(StaffExperienceData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Id'] = entity.id;
	data['Name'] = entity.name;
	data['Description'] = entity.description;
	data['LastPosition'] = entity.lastPosition;
	data['Company'] = entity.company;
	data['Location'] = entity.location;
	data['EndYear'] = entity.endYear;
	data['Duration'] = entity.duration;
	data['StaffId'] = entity.staffId;
	data['loading'] = entity.loading;
	return data;
}