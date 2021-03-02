import 'package:kukelola_flutter/networking/model/corporate_calendar.dart';

corporateCalendarFromJson(CorporateCalendar data, Map<String, dynamic> json) {
	if (json['Data'] != null) {
		data.data = new List<CorporateCalendarData>();
		(json['Data'] as List).forEach((v) {
			data.data.add(new CorporateCalendarData().fromJson(v));
		});
	}
	if (json['Total'] != null) {
		data.total = json['Total'] is String
				? int.tryParse(json['Total'])
				: json['Total'].toInt();
	}
	return data;
}

Map<String, dynamic> corporateCalendarToJson(CorporateCalendar entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.data != null) {
		data['Data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	data['Total'] = entity.total;
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