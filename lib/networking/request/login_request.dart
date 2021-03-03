class LoginRequest {
  String grant_type = 'password';
  String username;
  String password;
  String otp;
  String autologin;

  LoginRequest(this.username, this.password, this.otp, this.autologin);

  dynamic getBody() {
    return {
      'grant_type': grant_type,
      'username': username,
      'password': password,
      'otp': otp,
      'autologin': autologin,
    };
  }
}