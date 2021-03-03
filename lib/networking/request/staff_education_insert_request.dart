class StaffEducationInsertRequest {

  String StaffId;
  int EducationStep;
  int StartYear;
  int EndYear;
  String Institution;
  String Major;
  String Score;

  StaffEducationInsertRequest(this.StaffId, this.EducationStep, this.StartYear,
      this.EndYear, this.Institution, this.Major, this.Score);

  dynamic getBody() {
    return {
      "StaffId": StaffId,
      "EducationStep": EducationStep,
      "StartYear": StartYear,
      "EndYear": EndYear,
      "Institution": Institution,
      "Major": Major,
      "Score": Score
    };
  }
}