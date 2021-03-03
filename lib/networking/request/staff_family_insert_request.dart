class StaffFamilyInsertRequest {
  String StaffId;
  String Name;
  String Relation;
  String IdentificationNumner;
  String Occupation;
  String DateOfBirth;
  String Phone;

  StaffFamilyInsertRequest(this.StaffId, this.Name, this.Relation,
      this.IdentificationNumner, this.Occupation, this.DateOfBirth, this.Phone);

  dynamic getBody() {
    return {
      "StaffId": StaffId,
      "Name": Name,
      "Relation": Relation,
      "IdentificationNumner": IdentificationNumner,
      "Occupation": Occupation,
      "DateOfBirth": DateOfBirth,
      "Phone": Phone
    };
  }
}