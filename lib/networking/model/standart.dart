class Standart {
    bool isSuccess;
    String message;

    Standart({this.isSuccess, this.message});

    factory Standart.fromJson(Map<String, dynamic> json) {
        return Standart(
            isSuccess: json['isSuccess'], 
            message: json['message'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['isSuccess'] = this.isSuccess;
        data['message'] = this.message;
        return data;
    }
}