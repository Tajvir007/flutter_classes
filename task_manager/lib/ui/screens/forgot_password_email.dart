import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/background_page_logo.dart';
import 'package:task_manager/ui/screens/background_screen.dart';
import 'package:task_manager/ui/screens/forget_password_verify_otp_screen.dart';

import 'login_page.dart';

class ForgotPasswordEmail extends StatefulWidget {
  const ForgotPasswordEmail({super.key});

  @override
  State<ForgotPasswordEmail> createState() => _ForgotPasswordEmailState();
}

class _ForgotPasswordEmailState extends State<ForgotPasswordEmail> {
  @override
  Widget build(BuildContext context) {

    void onTapSignIn(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
    }

    return Scaffold(
      body: BackgroundScreen(
        child: BackgroundPageLogo(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  Text('Your Email Address',
                  style: Theme.of(context).textTheme.titleLarge,
                  ),

                  SizedBox(height: 10,),
                  Text('A 6 degit code will be sent to your email',
                  style: Theme.of(context).textTheme.bodyLarge,
                  ),

                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                    ),
                  ),

                  SizedBox(height: 10,),
                  SizedBox(
                      width: double.infinity,
                      child: FilledButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPasswordVerifyOtpScreen()));
                      },
                          child: Icon(
                              Icons.arrow_circle_right_outlined))),

                  SizedBox(height: 10,),
                  RichText(text: TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),

                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold
                          ),

                          recognizer: TapGestureRecognizer()
                            ..onTap = onTapSignIn
                          
                        ),
                      ]

                  ),),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
