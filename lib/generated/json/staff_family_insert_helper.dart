import 'package:kukelola_flutter/networking/model/staff_family_insert.dart';

staffFamilyInsertFromJson(StaffFamilyInsert data, Map<String, dynamic> json) {
	if (json['Data'] != null) {
		data.data = new StaffFamilyInsertData().fromJson(json['Data']);
	}
	if (json['Total'] != null) {
		data.total = json['Total'] is String
				? int.tryParse(json['Total'])
				: json['Total'].toInt();
	}
	if (json['Errors'] != null) {
		data.errors = new List<dynamic>();
		data.errors.addAll(json['Errors']);
	}
	if (json['Message'] != null) {
		data.message = json['Message'];
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
	return data;
}

Map<String, dynamic> staffFamilyInsertToJson(StaffFamilyInsert entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.data != null) {
		data['Data'] = entity.data.toJson();
	}
	data['Total'] = entity.total;
	if (entity.errors != null) {
		data['Errors'] =  [];
	}
	data['Message'] = entity.message;
	data['IsSuccess'] = entity.isSuccess;
	data['IsAdmin'] = entity.isAdmin;
	data['IsSuperAdmin'] = entity.isSuperAdmin;
	data['IsFinance'] = entity.isFinance;
	return data;
}

staffFamilyInsertDataFromJson(StaffFamilyInsertData data, Map<String, dynamic> json) {
	if (json['Id'] != null) {
		data.id = json['Id'].toString();
	}
	if (json['Name'] != null) {
		data.name = json['Name'].toString();
	}
	if (json['Description'] != null) {
		data.description = json['Description'];
	}
	if (json['Relation'] != null) {
		data.relation = json['Relation'].toString();
	}
	if (json['IdentificationNumber'] != null) {
		data.identificationNumber = json['IdentificationNumber'].toString();
	}
	if (json['DateOfBirth'] != null) {
		data.dateOfBirth = json['DateOfBirth'].toString();
	}
	if (json['Occupation'] != null) {
		data.occupation = json['Occupation'].toString();
	}
	if (json['Phone'] != null) {
		data.phone = json['Phone'].toString();
	}
	if (json['StaffId'] != null) {
		data.staffId = json['StaffId'].toString();
	}
	return data;
}

Map<String, dynamic> staffFamilyInsertDataToJson(StaffFamilyInsertData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Id'] = entity.id;
	data['Name'] = entity.name;
	data['Description'] = entity.description;
	data['Relation'] = entity.relation;
	data['IdentificationNumber'] = entity.identificationNumber;
	data['DateOfBirth'] = entity.dateOfBirth;
	data['Occupation'] = entity.occupation;
	data['Phone'] = entity.phone;
	data['StaffId'] = entity.staffId;
	return data;
}