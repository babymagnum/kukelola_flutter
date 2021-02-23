class Standart {
    bool IsSuccess;
    String Message;

    Standart({this.IsSuccess, this.Message});

    factory Standart.fromJson(Map<String, dynamic> json) {
        return Standart(
            IsSuccess: json['IsSuccess'],
            Message: json['Message'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['IsSuccess'] = this.IsSuccess;
        data['Message'] = this.Message;
        return data;
    }
}