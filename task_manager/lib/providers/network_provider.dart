import 'package:flutter/material.dart';
import 'package:task_manager/core/enums/api_state.dart';
import 'package:task_manager/data/models/user_model.dart';

import '../data/services/api_caller.dart';
import '../data/utils/urls.dart';

class NetworkProvider extends ChangeNotifier{

  ApiState _logInState = ApiState.initial;
  ApiState _registrationState = ApiState.initial;
  ApiState _profileUpdateState = ApiState.initial;

  String ? _errorMessage;

  ApiState get logInState => _logInState;
  ApiState get registrationState => _registrationState;
  ApiState get profileUpdateState => _profileUpdateState;
  String ? get errorMessage => _errorMessage;


  Future <Map<String, dynamic>?> login({
    required String email,
    required String password,
}) async {

    // Create a request body to send data to api caller and store in requestBody variable
    Map<String, dynamic> requestBody = {
      "email": email,
      "password": password,

    };

    // Call api. Create response object to store the response from api caller and store in response variable
    final ApiResponse response = await ApiCaller.postRequest(
      url: Urls.loginUrl,
      body: requestBody,
    );


    if(response.isSuccessful){
      _logInState = ApiState.success;
      notifyListeners();
      return {

        // Save user data in shared preferences and navigate to main screen
        'user' : UserModel.fromJson(response.responseData['data']),
        'token' : response.responseData['token']

      };
    }else{
      _logInState = ApiState.error;
      _errorMessage = response.errorMessage ?? 'Login failed';
      notifyListeners();
      return null;
    }


  }





  Future <Map<String, dynamic>?> register({
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
    required String password,
  }) async {

    _registrationState = ApiState.loading;
    _errorMessage = null;
    notifyListeners();

    // Create a request body to send data to api caller and store in requestBody variable
    Map<String, dynamic> requestBody = {
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "mobile": phone,
      "password": password,

    };

    // Call api. Create response object to store the response from api caller and store in response variable
    final ApiResponse response = await ApiCaller.postRequest(
      url: Urls.registrationUrl,
      body: requestBody,
    );


    if(response.isSuccessful){
      _registrationState = ApiState.success;
      notifyListeners();
      return response.responseData;
    }else{
      _logInState = ApiState.error;
      _errorMessage = response.errorMessage ?? 'Login failed';
      notifyListeners();
      return null;
    }


  }


}