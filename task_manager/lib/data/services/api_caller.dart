import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:task_manager/app.dart';
import 'package:task_manager/ui/controller/auth_controller.dart';

/**
 * এইটা basically একটা clean API service layer — GET/POST request handle করে, response decode করে,
 * আর সবকিছু nicely wrap করে ApiResponse ক্লাসে রিটার্ন দেয়।
 */
class ApiCaller {
  // Logger object তৈরি করা হচ্ছে, যেটা console এ request/response log দেখাবে
  static final Logger _logger = Logger();

  // =========================
  // GET REQUEST METHOD
  // =========================
  static Future<ApiResponse> getRequest({required String url}) async {
    try {
      _logRequest(url); // API call করার আগে request log করা হচ্ছে
      Uri uri = Uri.parse(url); // String url কে Uri format এ convert করা হচ্ছে
      Response response = await get(
        uri, // get response from url and store in response variable
        headers: {
          'token':
              AuthController.accessToken ??
              '', // যদি AuthController.accessToken null না হয়, তাহলে সেটার value নাও আর যদি null হয়, তাহলে empty string ('') পাঠাও
        },
      );
      _logResponse(url, response);
      final int statusCode = response
          .statusCode; // HTTP status code (200, 404, 500 etc) store করা হচ্ছে
      final decodeJson = jsonDecode(
        response.body,
      ); // Response body (JSON string) কে Dart object এ convert করা হচ্ছে

      if (statusCode == 200) {
        return ApiResponse(
          responseCode: statusCode,
          responseData: decodeJson,
          isSuccessful: true,
        );

        // 2. status_code 401: It's an unauthorized login. Create and call a method to move to login screen
      } else if (statusCode == 401) {
        await _moveToLogIn();
        return ApiResponse(
          responseCode: -1,
          responseData: null,
          isSuccessful: false,
        );
      } else {
        return ApiResponse(
          responseCode: statusCode,
          responseData: decodeJson,
          isSuccessful: false,
        );
      }
    } catch (e) {
      return ApiResponse(
        responseCode: -1,
        responseData: null,
        isSuccessful: false,
        errorMessage: e.toString(),
      );
    }
  }

  // =========================
  // POST REQUEST METHOD
  // =========================
  static Future<ApiResponse> postRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      _logRequest(url, body: body); // POST request এর url + body log করা হচ্ছে
      Uri uri = Uri.parse(url); // String url কে Uri এ convert করা হচ্ছে
      Response response = await post(
        uri,
        headers: {
          // Server কে জানানো হচ্ছে JSON পাঠানো হচ্ছে
          "Accept": "application/json",
          "Content-Type": "application/json",
          'token':
              AuthController.accessToken ??
              '', // যদি AuthController.accessToken null না হয়, তাহলে সেটার value নাও আর যদি null হয়, তাহলে empty string ('') পাঠাও
        },
        body: body != null
            ? jsonEncode(body)
            : null, // body থাকলে jsonEncode করা হচ্ছে
      ); // get response from url and store in response variable

      _logResponse(url, response); // Response log করা হচ্ছে
      final int statusCode = response
          .statusCode; // Store response status is it success or fail in statusCode variable
      final decodedData = jsonDecode(
        response.body,
      ); // Decode the json response and store in decodeJson variable

      if (statusCode == 200 || statusCode == 201) {
        return ApiResponse(
          responseCode: statusCode,
          responseData: decodedData,
          isSuccessful: true,
        );
        // 2.1 status_code 401: It's an unauthorized login. Create and call a method to move to login screen
      }else if (statusCode == 401) {
        await _moveToLogIn();
        return ApiResponse(
          responseCode: -1,
          responseData: null,
          isSuccessful: false,
        );
      } else {
        return ApiResponse(
          responseCode: statusCode,
          responseData: decodedData,
          isSuccessful: false,
        );
      }
    } catch (e) {
      return ApiResponse(
        responseCode: -1,
        responseData: null,
        isSuccessful: false,
        errorMessage: e.toString(),
      );
    }
  }

  static void _logRequest(String url, {Map<String, dynamic>? body}) {
    _logger.i(
      'Url => $url\n'
      'Request Body => $body\n',
    );
  }

  static void _logResponse(String url, Response response) {
    _logger.i(
      'Url => $url\n'
      'Status Code => ${response.statusCode}\n'
      'Response Body => ${response.body}\n',
    );
  }

  // 2. status_code 401: It's an unauthorized login. User need to login again for his token to be valid
  static Future<void> _moveToLogIn() async {
    AuthController.clearUserData();
    Navigator.pushNamedAndRemoveUntil(
      TaskManagerApp.navigator.currentContext!,
      '/Login',
      (predicate) => false,
    );
  }
}

class ApiResponse {
  final int responseCode;
  final dynamic responseData; // dynamic because
  final bool isSuccessful;
  final String? errorMessage;

  ApiResponse({
    required this.responseCode,
    required this.responseData,
    required this.isSuccessful,
    this.errorMessage = 'Something went wrong',
  }) {}
}
