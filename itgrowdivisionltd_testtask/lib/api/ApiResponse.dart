class ApiResponse<T> {
  T? data;
  bool error;
  String? errorMessage;
  num? code;

  ApiResponse({this.data, this.error = false, this.errorMessage, this.code});
}
