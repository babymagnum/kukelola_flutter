import 'package:kukelola_flutter/main.dart';

class WorkflowApprovalRequest {

  String Text;
  int WorkflowType;
  int RequestType;
  bool IsOngoing;
  int Month;
  int Year;

  WorkflowApprovalRequest(this.Text, this.IsOngoing, this.Month, this.RequestType, this.WorkflowType, this.Year);

  dynamic getBody() {
    return {
      "Text": Text,
      "WorkflowType": WorkflowType,
      "RequestType": RequestType,
      "IsOngoing": IsOngoing,
      "Month": Month,
      "Year": Year,
      // "UserId": homeController.userData.value.userId,
      // "ClientId": homeController.userData.value.clientId
    };
  }
}