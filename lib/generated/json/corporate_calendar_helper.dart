import 'package:kukelola_flutter/networking/model/corporate_calendar.dart';

corporateCalendarFromJson(CorporateCalendar data, Map<String, dynamic> json) {
	if (json['Data'] != null) {
		data.data = (json['Data'] as List).map((v) => CorporateCalendarData().fromJson(v)).toList();
	}
	if (json['Total'] != null) {
		data.total = json['Total'] is String
				? int.tryParse(json['Total'])
				: json['Total'].toInt();
	}
	if (json['errorMessage'] != null) {
		data.errorMessage = json['errorMessage'].toString();
	}
	return data;
}

Map<String, dynamic> corporateCalendarToJson(CorporateCalendar entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Data'] =  entity.data?.map((v) => v.toJson())?.toList();
	data['Total'] = entity.total;
	data['errorMessage'] = entity.errorMessage;
	return data;
}

corporateCalendarDataFromJson(CorporateCalendarData data, Map<String, dynamic> json) {
	if (json['Id'] != null) {
		data.id = json['Id'].toString();
	}
	if (json['Name'] != null) {
		data.name = json['Name'].toString();
	}
	if (json['Description'] != null) {
		data.description = json['Description'].toString();
	}
	if (json['EventDate'] != null) {
		data.eventDate = json['EventDate'].toString();
	}
	if (json['IsHoliday'] != null) {
		data.isHoliday = json['IsHoliday'];
	}
	return data;
}

Map<String, dynamic> corporateCalendarDataToJson(CorporateCalendarData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Id'] = entity.id;
	data['Name'] = entity.name;
	data['Description'] = entity.description;
	data['EventDate'] = entity.eventDate;
	data['IsHoliday'] = entity.isHoliday;
	return data;
}