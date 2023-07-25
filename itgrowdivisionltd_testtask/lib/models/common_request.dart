class CommonRequest {
  CommonRequest({
      num? login,
      String? password,
  String? token}){
    _login = login;
    _password = password;
    _token = token;
}

  CommonRequest.fromJson(dynamic json) {
    _login = json['login'];
    _password = json['password'];
  }
  num? _login;
  String? _password;
  String? _token;
CommonRequest copyWith({  num? login,
  String? password, String? token
}) => CommonRequest(  login: login ?? _login,
  password: password ?? _password, token: token ?? _token
);
  num? get login => _login;
  String? get password => _password;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['login'] = _login;
    map['password'] = _password;
    map['token'] = _token;
    return map;
  }

}