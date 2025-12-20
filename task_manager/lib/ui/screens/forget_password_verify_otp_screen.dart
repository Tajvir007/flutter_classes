import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'background_page_logo.dart';
import 'background_screen.dart';
import 'change_password.dart';
import 'login_page.dart';

class ForgetPasswordVerifyOtpScreen extends StatefulWidget {
  const ForgetPasswordVerifyOtpScreen({super.key});

  @override
  State<ForgetPasswordVerifyOtpScreen> createState() =>
      _ForgetPasswordVerifyOtpScreenState();
}

class _ForgetPasswordVerifyOtpScreenState
    extends State<ForgetPasswordVerifyOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreen(
        child: BackgroundPageLogo(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text(
                    'PIN Verification',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                  SizedBox(height: 10),
                  Text(
                    'A 6 digits OTP sent to your email',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),

                  SizedBox(height: 10),
                  // TextFormField button for OTP
                  /**
                   * 1. Go to => https://pub.dev/packages/pin_code_fields
                   * 2. For pin code fields use this package
                   */
                  PinCodeTextField(
                    length: 6,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      inactiveColor: Colors.grey,
                       selectedColor: Colors.green, // Active pin color
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    appContext: context,
                  ),

                  // FilledButton for OTP verification
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ChangePassword(),
                          ),
                        );
                      },
                      child: Icon(Icons.arrow_circle_right_outlined),
                    ),
                  ),

                  // RichText is use for text with multiple spans
                  // TextSpan is use for text with multiple spans
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),

                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),

                          recognizer: TapGestureRecognizer()
                            ..onTap = (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                            }

                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
