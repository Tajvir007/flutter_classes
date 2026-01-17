import 'package:flutter/material.dart';


showSnackBarMessage(BuildContext context, String message){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,)
  );
}