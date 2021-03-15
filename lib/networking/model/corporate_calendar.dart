import 'package:kukelola_flutter/generated/json/base/json_convert_content.dart';
import 'package:kukelola_flutter/generated/json/base/json_field.dart';

class CorporateCalendar with JsonConvert<CorporateCalendar> {
	@JSONField(name: "Data")
	List<CorporateCalendarData> data;
	@JSONField(name: "Total")
	int total;
	String errorMessage;
}

class CorporateCalendarData with JsonConvert<CorporateCalendarData> {
	@JSONField(name: "Id")
	String id;
	@JSONField(name: "Name")
	String name;
	@JSONField(name: "Description")
	String description;
	@JSONField(name: "EventDate")
	String eventDate;
	@JSONField(name: "IsHoliday")
	bool isHoliday;
}
