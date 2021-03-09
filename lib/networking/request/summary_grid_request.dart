class SummaryGridRequest {
  String UserId;
  String StartDate;
  String EndDate;

  SummaryGridRequest(this.UserId, this.StartDate, this.EndDate);

  dynamic body() {
    return {
      "UserId": UserId,
      "StartDate": StartDate,
      "EndDate": EndDate
    };
  }
}