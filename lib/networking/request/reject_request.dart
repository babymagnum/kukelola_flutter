class RejectRequest {
  String Id;
  String RejectReason;

  RejectRequest(this.Id, this.RejectReason);

  dynamic getBody() {
    return {
      'Id': Id,
      'RejectReason': RejectReason
    };
  }
}