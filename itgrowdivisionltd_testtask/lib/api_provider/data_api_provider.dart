import 'dart:async';

import 'package:dio/dio.dart';
import 'package:itgrowdivisionltd_testtask/models/common_request.dart';
import 'dio/base_api_provider.dart';

class DataApiProvider extends BaseApiProvider {
  Future<Map<String, dynamic>> getOpenTrades(
      CommonRequest model, String token) async {
    try {
      final Response response = await getDio()
          .post('api/ClientCabinetBasic/GetOpenTrades',
          options: Options(headers: {"Authorization": 'Bearer ' + token}),
          data: model.toJson());
      return {
        "error": false,
        "response": response.data,
      };
    } on DioError catch (error) {
      return {
        "error": true,
        "response": error.response?.data,
      };
    }
  }

  Future<Map<String, dynamic>> submitLoginData(
      {required CommonRequest model}) async {
    try {
      final Response response = await await getDio()
          .post('api/ClientCabinetBasic/IsAccountCredentialsCorrect', data: model.toJson());
      return {
        "error": false,
        "response": response.data,
      };
    } on DioError catch (error) {
      return {
        "error": true,
        "response": error.response?.data,
      };
    }
  }

  Future<Map<String, dynamic>> getAccountInformation(
      CommonRequest model, String token) async {
    try {
      final Response response = await getDio()
          .post('api/ClientCabinetBasic/GetAccountInformation',
          options: Options(headers: {"Authorization": 'Bearer ' + token}),
          data: model.toJson());
      return {
        "error": false,
        "response": response.data,
      };
    } on DioError catch (error) {
      return {
        "error": true,
        "response": error.response?.data,
      };
    }
  }

  Future<Map<String, dynamic>> getLastFourNumbersPhone(
      CommonRequest model, String token) async {
    try {
      final Response response = await getDio()
          .post('api/ClientCabinetBasic/GetLastFourNumbersPhone',
          options: Options(headers: {"Authorization": 'Bearer ' + token}),
          data: model.toJson());
      return {
        "error": false,
        "response": response.data,
      };
    } on DioError catch (error) {
      return {
        "error": true,
        "response": error.response?.data,
      };
    }
  }

}
