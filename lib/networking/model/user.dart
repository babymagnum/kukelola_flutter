class User {
    Data data;
    List<String> errors;
    bool isSuccess;
    String message;

    User({this.data, this.errors, this.isSuccess, this.message});

    factory User.fromJson(Map<String, dynamic> json) {
        return User(
            data: json['data'] != null ? Data.fromJson(json['data']) : null,
            errors: json['errors'] != null ? new List<String>.from(json['errors']) : null, 
            isSuccess: json['isSuccess'], 
            message: json['message'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['isSuccess'] = this.isSuccess;
        data['message'] = this.message;
        if (this.data != null) {
            data['data'] = this.data.toJson();
        }
        if (this.errors != null) {
            data['errors'] = this.errors;
        }
        return data;
    }
}

class ProfilePicture {
    String file;
    String contentType;
    String fileName;

    ProfilePicture({this.file, this.contentType, this.fileName});

    factory ProfilePicture.fromJson(Map<String, dynamic> json) {
        return ProfilePicture(
            file: json['file'],
            contentType: json['contentType'],
            fileName: json['fileName'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['file'] = this.file;
        data['contentType'] = this.contentType;
        data['fileName'] = this.fileName;
        return data;
    }
}

class Data {
    String clientId;
    String clientName;
    String email;
    String firstName;
    String fullName;
    String id;
    bool isMailNotification;
    String jobTitle;
    String lastName;
    String middleName;
    String newPassword;
    String nip;
    String oldPassword;
    ProfilePicture profilePicture;
    String staffId;
    String userName;

    Data({this.clientId, this.clientName, this.email, this.firstName, this.fullName, this.id, this.isMailNotification, this.jobTitle, this.lastName, this.middleName, this.newPassword, this.nip, this.oldPassword, this.profilePicture, this.staffId, this.userName});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            clientId: json['clientId'],
            clientName: json['clientName'],
            email: json['email'],
            firstName: json['firstName'],
            fullName: json['fullName'],
            id: json['id'],
            isMailNotification: json['isMailNotification'],
            jobTitle: json['jobTitle'],
            lastName: json['lastName'],
            middleName: json['middleName'],
            newPassword: json['newPassword'],
            nip: json['nip'],
            oldPassword: json['oldPassword'],
            profilePicture: json['profilePicture'] != null ? ProfilePicture.fromJson(json['profilePicture']) : null,
            staffId: json['staffId'],
            userName: json['userName'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['clientId'] = this.clientId;
        data['clientName'] = this.clientName;
        data['email'] = this.email;
        data['firstName'] = this.firstName;
        data['fullName'] = this.fullName;
        data['id'] = this.id;
        data['isMailNotification'] = this.isMailNotification;
        data['jobTitle'] = this.jobTitle;
        data['lastName'] = this.lastName;
        data['middleName'] = this.middleName;
        data['newPassword'] = this.newPassword;
        data['nip'] = this.nip;
        data['oldPassword'] = this.oldPassword;
        data['staffId'] = this.staffId;
        data['userName'] = this.userName;
        if (this.profilePicture != null) {
            data['profilePicture'] = this.profilePicture.toJson();
        }
        return data;
    }
}