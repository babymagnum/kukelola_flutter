import 'package:kukelola_flutter/networking/model/staff.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';

staffFromJson(Staff data, Map<String, dynamic> json) {
	if (json['Data'] != null) {
		data.data = StaffData().fromJson(json['Data']);
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

Map<String, dynamic> staffToJson(Staff entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Data'] = entity.data?.toJson();
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

staffDataFromJson(StaffData data, Map<String, dynamic> json) {
	if (json['Id'] != null) {
		data.id = json['Id'].toString();
	}
	if (json['Name'] != null) {
		data.name = json['Name'].toString();
	}
	if (json['Description'] != null) {
		data.description = json['Description'].toString();
	}
	if (json['CityOfBirth'] != null) {
		data.cityOfBirth = json['CityOfBirth'].toString();
	}
	if (json['DateOfBirth'] != null) {
		data.dateOfBirth = json['DateOfBirth'].toString();
	}
	if (json['IdentificationNumber'] != null) {
		data.identificationNumber = json['IdentificationNumber'].toString();
	}
	if (json['Gender'] != null) {
		data.gender = json['Gender'] is String
				? int.tryParse(json['Gender'])
				: json['Gender'].toInt();
	}
	if (json['Religion'] != null) {
		data.religion = json['Religion'] is String
				? int.tryParse(json['Religion'])
				: json['Religion'].toInt();
	}
	if (json['MaritalStatus'] != null) {
		data.maritalStatus = json['MaritalStatus'] is String
				? int.tryParse(json['MaritalStatus'])
				: json['MaritalStatus'].toInt();
	}
	if (json['MainAddress'] != null) {
		data.mainAddress = json['MainAddress'].toString();
	}
	if (json['Nip'] != null) {
		data.nip = json['Nip'].toString();
	}
	if (json['JobTitleId'] != null) {
		data.jobTitleId = json['JobTitleId'].toString();
	}
	if (json['JobTitle'] != null) {
		data.jobTitle = json['JobTitle'].toString();
	}
	if (json['EmploymentType'] != null) {
		data.employmentType = json['EmploymentType'] is String
				? int.tryParse(json['EmploymentType'])
				: json['EmploymentType'].toInt();
	}
	if (json['StartWorking'] != null) {
		data.startWorking = json['StartWorking'].toString();
	}
	if (json['StopWorking'] != null) {
		data.stopWorking = json['StopWorking'].toString();
	}
	if (json['IsTerminate'] != null) {
		data.isTerminate = json['IsTerminate'];
	}
	if (json['TerminateReason'] != null) {
		data.terminateReason = json['TerminateReason'] is String
				? int.tryParse(json['TerminateReason'])
				: json['TerminateReason'].toInt();
	}
	if (json['TerminateDescription'] != null) {
		data.terminateDescription = json['TerminateDescription'];
	}
	if (json['TerminateDate'] != null) {
		data.terminateDate = json['TerminateDate'].toString();
	}
	if (json['TaxId'] != null) {
		data.taxId = json['TaxId'].toString();
	}
	if (json['TaxStatus'] != null) {
		data.taxStatus = json['TaxStatus'] is String
				? int.tryParse(json['TaxStatus'])
				: json['TaxStatus'].toInt();
	}
	if (json['TaxType'] != null) {
		data.taxType = json['TaxType'] is String
				? int.tryParse(json['TaxType'])
				: json['TaxType'].toInt();
	}
	if (json['DocumentPassword'] != null) {
		data.documentPassword = json['DocumentPassword'].toString();
	}
	if (json['BankName'] != null) {
		data.bankName = json['BankName'].toString();
	}
	if (json['BankAccountNumber'] != null) {
		data.bankAccountNumber = json['BankAccountNumber'].toString();
	}
	if (json['BankAccountName'] != null) {
		data.bankAccountName = json['BankAccountName'].toString();
	}
	if (json['UserId'] != null) {
		data.userId = json['UserId'].toString();
	}
	if (json['FirstName'] != null) {
		data.firstName = json['FirstName'].toString();
	}
	if (json['MiddleName'] != null) {
		data.middleName = json['MiddleName'];
	}
	if (json['LastName'] != null) {
		data.lastName = json['LastName'].toString();
	}
	if (json['Phone'] != null) {
		data.phone = json['Phone'].toString();
	}
	if (json['Email'] != null) {
		data.email = json['Email'].toString();
	}
	if (json['IsMailNotification'] != null) {
		data.isMailNotification = json['IsMailNotification'];
	}
	if (json['AppId'] != null) {
		data.appId = json['AppId'] is String
				? int.tryParse(json['AppId'])
				: json['AppId'].toInt();
	}
	if (json['EducationList'] != null) {
		data.educationList = json['EducationList'];
	}
	if (json['FamilyList'] != null) {
		data.familyList = json['FamilyList'];
	}
	if (json['ExperienceList'] != null) {
		data.experienceList = json['ExperienceList'];
	}
	return data;
}

Map<String, dynamic> staffDataToJson(StaffData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Id'] = entity.id;
	data['Name'] = entity.name;
	data['Description'] = entity.description;
	data['CityOfBirth'] = entity.cityOfBirth;
	data['DateOfBirth'] = entity.dateOfBirth;
	data['IdentificationNumber'] = entity.identificationNumber;
	data['Gender'] = entity.gender;
	data['Religion'] = entity.religion;
	data['MaritalStatus'] = entity.maritalStatus;
	data['MainAddress'] = entity.mainAddress;
	data['Nip'] = entity.nip;
	data['JobTitleId'] = entity.jobTitleId;
	data['JobTitle'] = entity.jobTitle;
	data['EmploymentType'] = entity.employmentType;
	data['StartWorking'] = entity.startWorking;
	data['StopWorking'] = entity.stopWorking;
	data['IsTerminate'] = entity.isTerminate;
	data['TerminateReason'] = entity.terminateReason;
	data['TerminateDescription'] = entity.terminateDescription;
	data['TerminateDate'] = entity.terminateDate;
	data['TaxId'] = entity.taxId;
	data['TaxStatus'] = entity.taxStatus;
	data['TaxType'] = entity.taxType;
	data['DocumentPassword'] = entity.documentPassword;
	data['BankName'] = entity.bankName;
	data['BankAccountNumber'] = entity.bankAccountNumber;
	data['BankAccountName'] = entity.bankAccountName;
	data['UserId'] = entity.userId;
	data['FirstName'] = entity.firstName;
	data['MiddleName'] = entity.middleName;
	data['LastName'] = entity.lastName;
	data['Phone'] = entity.phone;
	data['Email'] = entity.email;
	data['IsMailNotification'] = entity.isMailNotification;
	data['AppId'] = entity.appId;
	data['EducationList'] = entity.educationList;
	data['FamilyList'] = entity.familyList;
	data['ExperienceList'] = entity.experienceList;
	return data;
}