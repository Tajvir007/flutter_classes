
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/user_model.dart';

class AuthController{

  // SharedPreferences এ data save করার keys
  static String _accessTokenKey = 'Token';
  static String _userModelKey = 'user-data';

  // App চলাকালীন RAM এ data রাখা, বারবার SharedPreferences call না করার জন্য
  static String ? accessToken;
  static UserModel ? userModel;

  /**
   * 1. UserModel model → পুরো user info
   * 2. String token → login token (session key)
   * 3. এই method এর কাজ: token save করা. user info save করা
   */
  // login successful হলে এই method call হবে
  saveUserData(UserModel model, String token) async {

    // Crease shared preferences object to save data in device
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance(); // device local storage access করা হচ্ছে

    // token save
    await sharedPreferences.setString(_accessTokenKey, token); // token device এ save হচ্ছে,
    await sharedPreferences.setString(_userModelKey, jsonEncode(model.toJson())); // UserModel → Map → JSON String, SharedPreferences শুধু String save করতে পারে

    // Same data memory (RAM) এ রাখা, UI instantly use করতে পারে
    accessToken = token;
    userModel = model;

  }


  // App start হলে call হয়, Check করে user already logged in কিনা
  static Future getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String ? token = sharedPreferences.getString(_accessTokenKey); // token আছে কিনা check, Saved token read করা হচ্ছে

    // Token থাকলে user logged in
    if(token != null){
      String ? userData = sharedPreferences.getString(_userModelKey); // saved user JSON read করা হচ্ছে
      userModel = UserModel.fromJson(jsonDecode(userData!)); // JSON String → Map → UserModel, User session restore
    }

  }


}