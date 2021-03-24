import 'package:kukelola_flutter/core/helper/text_util.dart';
import 'package:kukelola_flutter/generated/json/base/json_convert_content.dart';
import 'package:kukelola_flutter/generated/json/base/json_field.dart';
import 'package:kukelola_flutter/main.dart';

class Staff with JsonConvert<Staff> {
	@JSONField(name: "Data")
	StaffData data;
	@JSONField(name: "Total")
	int total;
	@JSONField(name: "Errors")
	List<dynamic> errors;
	@JSONField(name: "Message")
	String message;
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

class StaffData with JsonConvert<StaffData> {
	@JSONField(name: "Id")
	String id;
	@JSONField(name: "Name")
	String name;
	@JSONField(name: "Description")
	String description;
	@JSONField(name: "CityOfBirth")
	String cityOfBirth = '';
	@JSONField(name: "DateOfBirth")
	String dateOfBirth = TextUtil.getCurrentDate('dd/MM/yyyy');
	@JSONField(name: "IdentificationNumber")
	String identificationNumber = '';
	@JSONField(name: "Gender")
	int gender = 1;
	@JSONField(name: "Religion")
	int religion = 1;
	@JSONField(name: "MaritalStatus")
	int maritalStatus = 1;
	@JSONField(name: "MainAddress")
	String mainAddress = '';
	@JSONField(name: "Nip")
	String nip;
	@JSONField(name: "JobTitleId")
	String jobTitleId;
	@JSONField(name: "JobTitle")
	String jobTitle;
	@JSONField(name: "EmploymentType")
	int employmentType;
	@JSONField(name: "StartWorking")
	String startWorking;
	@JSONField(name: "StopWorking")
	String stopWorking;
	@JSONField(name: "IsTerminate")
	bool isTerminate;
	@JSONField(name: "TerminateReason")
	int terminateReason;
	@JSONField(name: "TerminateDescription")
	dynamic terminateDescription;
	@JSONField(name: "TerminateDate")
	String terminateDate;
	@JSONField(name: "TaxId")
	String taxId;
	@JSONField(name: "TaxStatus")
	int taxStatus;
	@JSONField(name: "TaxType")
	int taxType;
	@JSONField(name: "DocumentPassword")
	String documentPassword;
	@JSONField(name: "BankName")
	String bankName;
	@JSONField(name: "BankAccountNumber")
	String bankAccountNumber;
	@JSONField(name: "BankAccountName")
	String bankAccountName;
	@JSONField(name: "UserId")
	String userId;
	@JSONField(name: "FirstName")
	String firstName = '';
	@JSONField(name: "MiddleName")
	dynamic middleName = '';
	@JSONField(name: "LastName")
	String lastName = '';
	@JSONField(name: "Phone")
	String phone = '';
	@JSONField(name: "Email")
	String email;
	@JSONField(name: "IsMailNotification")
	bool isMailNotification;
	@JSONField(name: "AppId")
	int appId;
	@JSONField(name: "EducationList")
	dynamic educationList;
	@JSONField(name: "FamilyList")
	dynamic familyList;
	@JSONField(name: "ExperienceList")
	dynamic experienceList;

	dynamic getJsonBody() {
		return {
			"Id": homeController.userData.value.staffId,
			"FirstName": firstName,
			"MiddleName": middleName,
			"LastName": lastName,
			"Phone": phone,
			"Email": email,
			"CityOfBirth": cityOfBirth,
			"DateOfBirth": dateOfBirth,
			"IdentificationNumber": identificationNumber,
			"Gender": gender,
			"Religion": religion,
			"MaritalStatus": maritalStatus,
			"MainAddress": mainAddress,
			"Nip": nip,
			"EmploymentType": employmentType,
			"JobTitleId": jobTitleId,
			"StartWorking": startWorking,
			"StopWorking": stopWorking,
			"TaxId": taxId,
			"TaxStatus": taxStatus,
			"TaxType": taxType,
			"DocumentPassword": documentPassword,
			"BankName": bankName,
			"BankAccountName": bankAccountName,
			"BankAccountNumber": bankAccountNumber
		};
	}
}
