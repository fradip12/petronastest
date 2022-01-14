class LoginModel {
  late String token;
  late String expire;

  LoginModel(this.token, this.expire);

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json["token"];
    expire = json["expire"];
  }

  LoginModel.empty()
      : token = '',
        expire = '';
}
