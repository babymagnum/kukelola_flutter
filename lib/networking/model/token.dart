import 'package:kukelola_flutter/generated/json/base/json_convert_content.dart';
import 'package:kukelola_flutter/generated/json/base/json_field.dart';

class Token with JsonConvert<Token> {
	@JSONField(name: "access_token")
	String accessToken;
	@JSONField(name: "token_type")
	String tokenType;
	@JSONField(name: "expires_in")
	int expiresIn;
	@JSONField(name: "UserId")
	String userId;
	@JSONField(name: "ClientId")
	String clientId;
	@JSONField(name: "StaffId")
	String staffId;
	@JSONField(name: "ClientName")
	String clientName;
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
	@JSONField(name: "Email")
	String email;
	@JSONField(name: "Nip")
	String nip;
	@JSONField(name: "JobTitle")
	String jobTitle;
	@JSONField(name: "ProfilePictureId")
	String profilePictureId;
	@JSONField(name: "error_description")
	String errorDescription;
	String Message;
	String errorMessage;
}
