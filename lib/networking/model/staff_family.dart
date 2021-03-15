import 'package:kukelola_flutter/generated/json/base/json_convert_content.dart';
import 'package:kukelola_flutter/generated/json/base/json_field.dart';

class StaffFamily with JsonConvert<StaffFamily> {
	@JSONField(name: "Data")
	List<StaffFamilyData> data;
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

class StaffFamilyData with JsonConvert<StaffFamilyData> {
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
	bool loading = false;
}
