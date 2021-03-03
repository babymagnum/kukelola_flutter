import 'package:kukelola_flutter/generated/json/base/json_convert_content.dart';
import 'package:kukelola_flutter/generated/json/base/json_field.dart';

class StaffFamilyInsert with JsonConvert<StaffFamilyInsert> {
	@JSONField(name: "Data")
	StaffFamilyInsertData data;
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
}

class StaffFamilyInsertData with JsonConvert<StaffFamilyInsertData> {
	@JSONField(name: "Id")
	String id;
	@JSONField(name: "Name")
	String name;
	@JSONField(name: "Description")
	dynamic description;
	@JSONField(name: "Relation")
	String relation;
	@JSONField(name: "IdentificationNumber")
	String identificationNumber;
	@JSONField(name: "DateOfBirth")
	String dateOfBirth;
	@JSONField(name: "Occupation")
	String occupation;
	@JSONField(name: "Phone")
	String phone;
	@JSONField(name: "StaffId")
	String staffId;
}
