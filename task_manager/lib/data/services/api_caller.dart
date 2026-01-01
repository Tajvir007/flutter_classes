import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';


class ApiCaller{

  static final Logger _logger = Logger();

  static Future<ApiResponse> getRequest({required String url}) async {

    try{

      _logRequest(url);
      Uri uri = Uri.parse(url); // parse url to uri
      Response response = await get(uri); // get response from url and store in response variable
      _logResponse(url, response);
      final int statusCode = response.statusCode; // Store response status is it success or fail in statusCode variable
      final decodeJson = jsonDecode(response.body); // Decode the json response and store in decodeJson variable

      if(statusCode == 200){

        return ApiResponse(responseCode: statusCode, responseData:decodeJson , isSuccessful: true);

      }else{
        return ApiResponse(responseCode: statusCode, responseData:decodeJson , isSuccessful: false);
      }

    }
    catch(e){

      return ApiResponse(responseCode: -1, responseData:null , isSuccessful: false, errorMessage: e.toString());

    }

  }

  static Future<ApiResponse> postRequest({required String url, Map<String, dynamic> ? body}) async {

    try{

      _logRequest(url, body: body);
      Uri uri = Uri.parse(url); // parse url to uri
      Response response = await post(uri,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      body: body != null ? jsonEncode(body) : null,
      ); // get response from url and store in response variable
      _logResponse(url, response);
      final int statusCode = response.statusCode; // Store response status is it success or fail in statusCode variable
      final decodedData = jsonDecode(response.body); // Decode the json response and store in decodeJson variable

      if(statusCode == 200 || statusCode == 201){

        return ApiResponse(responseCode: statusCode, responseData:decodedData , isSuccessful: true);

      }else{
        return ApiResponse(responseCode: statusCode, responseData: decodedData , isSuccessful: false);
      }

    }
    catch(e){

      return ApiResponse(responseCode: -1, responseData:null , isSuccessful: false, errorMessage: e.toString());

    }

  }


  static void _logRequest(String url, {Map<String, dynamic> ? body} ){

    _logger.i(
      'Url => $url\n'
      'Request Body => $body\n',
    );

  }

  static void _logResponse(String url, Response response ){

    _logger.i(
        'Url => $url\n'
            'Status Code => ${response.statusCode}\n'
            'Response Body => ${response.body}\n',
    );

  }


}


class ApiResponse{

  final int responseCode;
  final dynamic responseData; // dynamic because
  final bool isSuccessful;
  final String ? errorMessage;

  ApiResponse(
  {
    required this.responseCode,
    required this.responseData,
    required this.isSuccessful,
    this.errorMessage = 'Something went wrong'
  }
      ){
  }

}