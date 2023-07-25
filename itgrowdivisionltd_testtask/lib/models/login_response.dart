class LoginResponse {
  LoginResponse({
      bool? result, 
      String? token,}){
    _result = result;
    _token = token;
}

  LoginResponse.fromJson(dynamic json) {
    _result = json['result'];
    _token = json['token'];
  }
  bool? _result;
  String? _token;
LoginResponse copyWith({  bool? result,
  String? token,
}) => LoginResponse(  result: result ?? _result,
  token: token ?? _token,
);
  bool? get result => _result;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = _result;
    map['token'] = _token;
    return map;
  }

}