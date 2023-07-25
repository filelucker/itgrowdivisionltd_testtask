import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:itgrowdivisionltd_testtask/models/account_info_response.dart';
import 'package:itgrowdivisionltd_testtask/models/common_request.dart';
import 'package:itgrowdivisionltd_testtask/models/open_trade_response.dart';
import 'package:itgrowdivisionltd_testtask/pages/home.dart';
import 'package:itgrowdivisionltd_testtask/pages/login.dart';
import '../api_provider/data_api_provider.dart';
import '../models/login_response.dart';
import '../utils/widgets.dart';

class DataProvider extends ChangeNotifier {
  bool loading = false;
  DataApiProvider apiProvider = DataApiProvider();
  final storage = GetStorage();
  List<OpenTradeResponse> openTradeList = [];
  AccountInfoResponse accountInfo = new AccountInfoResponse();
  String lastFourNumbersPhone = '';

  void getOpenTrades(BuildContext context) async {
    loading = true;
    var model = CommonRequest(login: storage.read('login'), token: storage.read('token'));
    var connectionState = await checkConnection();
    if (connectionState) {
      var result = await apiProvider.getOpenTrades(model, storage.read('token'));
      loading = false;
      if (!result['error']) {
        result['response'].forEach((item) => openTradeList.add(OpenTradeResponse.fromJson(item)));
      } else{
        openTradeList = [];
        ShowToast.show('Access denied, Please Login', true);
        if(result['response'] == 'Access denied') {
          logoutUser(context);
        }
      }
    } else {
      ShowToast.show('No internet', true);
    }
    notifyListeners();
  }

  void loginUser(BuildContext context, CommonRequest model) async {
    var connectionState = await checkConnection();
    loading = true;
    notifyListeners();
    if (connectionState) {
      var result = await apiProvider.submitLoginData(model: model);
      if (result['error'] == true) {
        ShowToast.show('Invalid login or password', true);
      } else {
        if (result['response'] != null) {
         var data = LoginResponse.fromJson(result['response']);

         storage.write('login', model.login);
         storage.write('password', model.password);
         storage.write('token', data.token);
         Navigator.of(context).pushReplacement(MaterialPageRoute(
             builder: (context) => Home()));
        }

      }
    } else {
      ShowToast.show('No internet', true);
    }
    loading = false;
    notifyListeners();
  }

  void logoutUser(BuildContext context) {
    storage.remove('login');
    storage.remove('password');
    storage.remove('token');
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LoginPage()));
  }

  void getAccountInformation(BuildContext context) async {
    loading = true;
    var model = CommonRequest(login: storage.read('login'), token: storage.read('token'));
    var connectionState = await checkConnection();
    if (connectionState) {
      var result = await apiProvider.getAccountInformation(model, storage.read('token'));
      loading = false;
      if (!result['error']) {
       accountInfo = AccountInfoResponse.fromJson(result['response']);
      } else{
        accountInfo = AccountInfoResponse();
        ShowToast.show('Access denied, Please Login', true);
        if(result['response'] == 'Access denied') {
          logoutUser(context);
        }
      }
    } else {
      ShowToast.show('No internet', true);
    }
    notifyListeners();
  }

  void getLastFourNumbersPhone(BuildContext context) async {
    loading = true;
    var model = CommonRequest(login: storage.read('login'), token: storage.read('token'));
    var connectionState = await checkConnection();
    if (connectionState) {
      var result = await apiProvider.getLastFourNumbersPhone(model, storage.read('token'));
      loading = false;
      if (!result['error']) {
        lastFourNumbersPhone = result['response'];
      } else{
        lastFourNumbersPhone = '';
        ShowToast.show('Access denied, Please Login', true);
        if(result['response'] == 'Access denied') {
          logoutUser(context);
        }
      }
    } else {
      ShowToast.show('No internet', true);
    }
    notifyListeners();
  }
}
