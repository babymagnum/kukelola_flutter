import 'package:kukelola_flutter/generated/json/base/json_convert_content.dart';
import 'package:kukelola_flutter/generated/json/base/json_field.dart';

class User with JsonConvert<User> {
	@JSONField(name: "Data")
	UserData data;
	@JSONField(name: "Total")
	int total;
	@JSONField(name: "Errors")
	List<dynamic> errors;
	@JSONField(name: "Message")
	dynamic message;
	@JSONField(name: "IsSuccess")
	bool isSuccess;
	@JSONField(name: "IsAdmin")
	bool isAdmin;
	@JSONField(name: "IsSuperAdmin")
	bool isSuperAdmin;
	@JSONField(name: "IsFinance")
	bool isFinance;
	String errorMessage;
}

class UserData with JsonConvert<UserData> {
	@JSONField(name: "FirstName")
	String firstName;
	@JSONField(name: "MiddleName")
	String middleName;
	@JSONField(name: "LastName")
	String lastName;
	@JSONField(name: "FullName")
	String fullName;
	@JSONField(name: "UserName")
	String userName;
	@JSONField(name: "Nip")
	String nip;
	@JSONField(name: "JobTitle")
	String jobTitle;
	@JSONField(name: "Email")
	String email;
	@JSONField(name: "OldPassword")
	dynamic oldPassword;
	@JSONField(name: "NewPassword")
	dynamic newPassword;
	@JSONField(name: "IsMailNotification")
	bool isMailNotification;
	@JSONField(name: "ProfilePictureId")
	dynamic profilePictureId;
	@JSONField(name: "ProfilePicture")
	UserDataProfilePicture profilePicture;
	@JSONField(name: "Attachment")
	dynamic attachment;
	@JSONField(name: "Id")
	String id;
	@JSONField(name: "ClientId")
	String clientId;
	@JSONField(name: "ClientName")
	String clientName;
	@JSONField(name: "StaffId")
	String staffId;
	@JSONField(name: "Cords")
	int cords;
}

class UserDataProfilePicture with JsonConvert<UserDataProfilePicture> {
	@JSONField(name: "FileName")
	String fileName;
	@JSONField(name: "ContentType")
	String contentType;
	@JSONField(name: "File")
	String file;
}
