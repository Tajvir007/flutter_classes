import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}


class _PasswordState extends State<Password> {


  bool isShowPassword = false;

  showPassword(){
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              TextField(
                obscureText: isShowPassword, // To hide the password
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey),
                  suffixIcon: IconButton(
                      icon: Icon(
                          isShowPassword ? Icons.remove_red_eye :
                              Icons.visibility_off
                          ),
                    onPressed: showPassword,
                  ),
                ),
                style: TextStyle(
                  color: Colors.green
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
