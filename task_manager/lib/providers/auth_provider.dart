import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/core/enums/api_state.dart';

import '../data/models/user_model.dart';

class AuthProvider extends ChangeNotifier{ // এই ক্লাস থেকে UI কে notify করা যাবে যখন data change হবে

  String? _accessToken;
  String? _errorMessage;
  UserModel? _userModel; // logged in user এর পুরো data

  // SharedPreferences এ data save করার keys
  static String _accessTokenKey = 'Token';
  static String _userModelKey = 'user-data';

  ApiState _authState = ApiState.initial;


  // private variable (_) সরাসরি access করা যাবে না
  // getter দিয়ে safe read access দেওয়া হচ্ছে
  String ? get accessToken => _accessToken;
  UserModel ? get userModel => _userModel;
  ApiState ? get authState => _authState;
  String ? get errorMessage => _errorMessage;
  bool get isLoggedIn => _accessToken != null;


  // login successful হলে এই method call হবে
   Future saveUserData(UserModel model, String token) async {

    // Crease shared preferences object to save data in device
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance(); // device local storage access করা হচ্ছে

    // token save
    await sharedPreferences.setString(_accessTokenKey, token); // token device এ save হচ্ছে,
    await sharedPreferences.setString(_userModelKey, jsonEncode(model.toJson())); // UserModel → Map → JSON String, SharedPreferences শুধু String save করতে পারে

    // Same data memory (RAM) এ রাখা, UI instantly use করতে পারে
    _accessToken = token;
    _userModel = model;

    notifyListeners(); // Provider কে বলা হচ্ছে → UI update করো

  }


  // App start হলে call হয়, Check করে user already logged in কিনা
   Future loadUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String ? token = sharedPreferences.getString(_accessTokenKey); // token আছে কিনা check, Saved token read করা হচ্ছে

    // Token থাকলে user logged in
    if(token != null){
      _accessToken = token;
      String ? userData = sharedPreferences.getString(_userModelKey); // saved user JSON read করা হচ্ছে
      _userModel = UserModel.fromJson(jsonDecode(userData!)); // JSON String → Map → UserModel, User session restore
    }

    notifyListeners();

  }


  // Update user profile
   Future<void> updateUserData(UserModel model) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance(); // device local storage access করা হচ্ছে
    await sharedPreferences.setString(_userModelKey, jsonEncode(model.toJson())); //User model অবজেক্টকে JSON string বানিয়ে SharedPreferences-এ সেভ করা, যাতে অ্যাপ বন্ধ হলেও লগইন/ইউজার ডাটা থেকে যায়।

     notifyListeners();
  }


  // Check User loggedIn or not
  static Future<bool> checkLogInStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance(); // device local storage access করা হচ্ছে
    String ? token = sharedPreferences.getString(_accessTokenKey); // SharedPreferences থেকে _accessTokenKey ব্যবহার করে saved access token পড়া হচ্ছে (না থাকলে null আসবে)

    return token != null; // token null না হলে → true (user logged in ✅), token null হলে → false (user logged out ❌)

  }


  // Clear user data from device when log out
   Future<void> logOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    _accessToken = null;
    _userModel = null;
    _authState = ApiState.initial;
    notifyListeners();
  }


  void setLoading(){
     _authState = ApiState.loading;
     notifyListeners();
  }

  void setSuccess(){
    _authState = ApiState.success;
    notifyListeners();
  }

  void setError(){
    _authState = ApiState.error;
    notifyListeners();
  }

  void resetState(){
    _authState = ApiState.initial;
    _errorMessage = null;
    notifyListeners();
  }


}