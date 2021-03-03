import 'package:kukelola_flutter/generated/json/base/json_convert_content.dart';
import 'package:kukelola_flutter/generated/json/base/json_field.dart';

class StaffExperience with JsonConvert<StaffExperience> {
	@JSONField(name: "Data")
	List<StaffExperienceData> data;
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

class StaffExperienceData with JsonConvert<StaffExperienceData> {
	@JSONField(name: "Id")
	String id;
	@JSONField(name: "Name")
	String name;
	@JSONField(name: "Description")
	String description;
	@JSONField(name: "LastPosition")
	String lastPosition;
	@JSONField(name: "Company")
	String company;
	@JSONField(name: "Location")
	String location;
	@JSONField(name: "EndYear")
	String endYear;
	@JSONField(name: "Duration")
	String duration;
	@JSONField(name: "StaffId")
	String staffId;
}
