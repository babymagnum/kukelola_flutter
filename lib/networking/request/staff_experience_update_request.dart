class StaffExperienceUpdateRequest {

  String Id;
  String StaffId;
  String LastPosition;
  String Company;
  String Location;
  int EndYear;
  String Duration;

  StaffExperienceUpdateRequest(this.Id, this.StaffId, this.LastPosition, this.Company,
      this.Location, this.EndYear, this.Duration);

  dynamic getBody() {
    return {
      "Id": Id,
      "StaffId": StaffId,
      "LastPosition": LastPosition,
      "Company": Company,
      "Location": Location,
      "EndYear": EndYear,
      "Duration": Duration
    };
  }
}