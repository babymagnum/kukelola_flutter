class StaffFamilyUpdateRequest {
  String Id;
  String StaffId;
  String Name;
  String Relation;
  String IdentificationNumber;
  String Occupation;
  String DateOfBirth;
  String Phone;

  StaffFamilyUpdateRequest(this.Id, this.StaffId, this.Name, this.Relation,
      this.IdentificationNumber, this.Occupation, this.DateOfBirth, this.Phone);

  dynamic getBody() {
    return {
      "Id": Id,
      "StaffId": StaffId,
      "Name": Name,
      "Relation": Relation,
      "IdentificationNumber": IdentificationNumber,
      "Occupation": Occupation,
      "DateOfBirth": DateOfBirth,
      "Phone": Phone
    };
  }
}