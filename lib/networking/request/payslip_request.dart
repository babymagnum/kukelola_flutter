class PayslipRequest {
  String UserId;
  int Month;
  int Year;

  PayslipRequest(this.UserId, this.Month, this.Year);

  dynamic getBody() {
    return {
      "UserId": UserId,
      "Month": Month,
      "Year": Year
    };
  }
}