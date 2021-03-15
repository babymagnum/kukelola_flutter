import 'package:kukelola_flutter/networking/model/token.dart';

tokenFromJson(Token data, Map<String, dynamic> json) {
	if (json['access_token'] != null) {
		data.accessToken = json['access_token'].toString();
	}
	if (json['token_type'] != null) {
		data.tokenType = json['token_type'].toString();
	}
	if (json['expires_in'] != null) {
		data.expiresIn = json['expires_in'] is String
				? int.tryParse(json['expires_in'])
				: json['expires_in'].toInt();
	}
	if (json['UserId'] != null) {
		data.userId = json['UserId'].toString();
	}
	if (json['ClientId'] != null) {
		data.clientId = json['ClientId'].toString();
	}
	if (json['StaffId'] != null) {
		data.staffId = json['StaffId'].toString();
	}
	if (json['ClientName'] != null) {
		data.clientName = json['ClientName'].toString();
	}
	if (json['FirstName'] != null) {
		data.firstName = json['FirstName'].toString();
	}
	if (json['MiddleName'] != null) {
		data.middleName = json['MiddleName'].toString();
	}
	if (json['LastName'] != null) {
		data.lastName = json['LastName'].toString();
	}
	if (json['FullName'] != null) {
		data.fullName = json['FullName'].toString();
	}
	if (json['UserName'] != null) {
		data.userName = json['UserName'].toString();
	}
	if (json['Email'] != null) {
		data.email = json['Email'].toString();
	}
	if (json['Nip'] != null) {
		data.nip = json['Nip'].toString();
	}
	if (json['JobTitle'] != null) {
		data.jobTitle = json['JobTitle'].toString();
	}
	if (json['ProfilePictureId'] != null) {
		data.profilePictureId = json['ProfilePictureId'];
	}
	if (json['error_description'] != null) {
		data.errorDescription = json['error_description'].toString();
	}
	if (json['errorMessage'] != null) {
		data.errorMessage = json['errorMessage'].toString();
	}
	return data;
}

Map<String, dynamic> tokenToJson(Token entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['access_token'] = entity.accessToken;
	data['token_type'] = entity.tokenType;
	data['expires_in'] = entity.expiresIn;
	data['UserId'] = entity.userId;
	data['ClientId'] = entity.clientId;
	data['StaffId'] = entity.staffId;
	data['ClientName'] = entity.clientName;
	data['FirstName'] = entity.firstName;
	data['MiddleName'] = entity.middleName;
	data['LastName'] = entity.lastName;
	data['FullName'] = entity.fullName;
	data['UserName'] = entity.userName;
	data['Email'] = entity.email;
	data['Nip'] = entity.nip;
	data['JobTitle'] = entity.jobTitle;
	data['ProfilePictureId'] = entity.profilePictureId;
	data['error_description'] = entity.errorDescription;
	data['errorMessage'] = entity.errorMessage;
	return data;
}