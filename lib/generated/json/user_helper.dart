import 'package:kukelola_flutter/networking/model/user.dart';

userFromJson(User data, Map<String, dynamic> json) {
	if (json['Data'] != null) {
		data.data = new UserData().fromJson(json['Data']);
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
	if (json['errorMessage'] != null) {
		data.errorMessage = json['errorMessage'].toString();
	}
	return data;
}

Map<String, dynamic> userToJson(User entity) {
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
	data['errorMessage'] = entity.errorMessage;
	return data;
}

userDataFromJson(UserData data, Map<String, dynamic> json) {
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
	if (json['Nip'] != null) {
		data.nip = json['Nip'].toString();
	}
	if (json['JobTitle'] != null) {
		data.jobTitle = json['JobTitle'].toString();
	}
	if (json['Email'] != null) {
		data.email = json['Email'].toString();
	}
	if (json['OldPassword'] != null) {
		data.oldPassword = json['OldPassword'];
	}
	if (json['NewPassword'] != null) {
		data.newPassword = json['NewPassword'];
	}
	if (json['IsMailNotification'] != null) {
		data.isMailNotification = json['IsMailNotification'];
	}
	if (json['ProfilePictureId'] != null) {
		data.profilePictureId = json['ProfilePictureId'];
	}
	if (json['ProfilePicture'] != null) {
		data.profilePicture = new UserDataProfilePicture().fromJson(json['ProfilePicture']);
	}
	if (json['Attachment'] != null) {
		data.attachment = json['Attachment'];
	}
	if (json['Id'] != null) {
		data.id = json['Id'].toString();
	}
	if (json['ClientId'] != null) {
		data.clientId = json['ClientId'].toString();
	}
	if (json['ClientName'] != null) {
		data.clientName = json['ClientName'].toString();
	}
	if (json['StaffId'] != null) {
		data.staffId = json['StaffId'].toString();
	}
	if (json['Cords'] != null) {
		data.cords = json['Cords'] is String
				? int.tryParse(json['Cords'])
				: json['Cords'].toInt();
	}
	return data;
}

Map<String, dynamic> userDataToJson(UserData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['FirstName'] = entity.firstName;
	data['MiddleName'] = entity.middleName;
	data['LastName'] = entity.lastName;
	data['FullName'] = entity.fullName;
	data['UserName'] = entity.userName;
	data['Nip'] = entity.nip;
	data['JobTitle'] = entity.jobTitle;
	data['Email'] = entity.email;
	data['OldPassword'] = entity.oldPassword;
	data['NewPassword'] = entity.newPassword;
	data['IsMailNotification'] = entity.isMailNotification;
	data['ProfilePictureId'] = entity.profilePictureId;
	if (entity.profilePicture != null) {
		data['ProfilePicture'] = entity.profilePicture.toJson();
	}
	data['Attachment'] = entity.attachment;
	data['Id'] = entity.id;
	data['ClientId'] = entity.clientId;
	data['ClientName'] = entity.clientName;
	data['StaffId'] = entity.staffId;
	data['Cords'] = entity.cords;
	return data;
}

userDataProfilePictureFromJson(UserDataProfilePicture data, Map<String, dynamic> json) {
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

Map<String, dynamic> userDataProfilePictureToJson(UserDataProfilePicture entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['FileName'] = entity.fileName;
	data['ContentType'] = entity.contentType;
	data['File'] = entity.file;
	return data;
}