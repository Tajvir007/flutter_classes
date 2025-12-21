import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/background_page_logo.dart';
import 'package:task_manager/ui/widgets/background_screen.dart';
import 'package:task_manager/ui/screens/forgot_password_email.dart';
import 'package:task_manager/ui/screens/main_nav_bar_holder_screen.dart';
import 'package:task_manager/ui/screens/sign_up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    //1. Method for sign up
    void onTapSignUp(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
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

                  Text('Welcome Back',
                  style: Theme.of(context).textTheme.titleLarge,
                  ),

                  SizedBox(height: 30,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                    ),
                  ),

                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                    ),
                  ),

                  // FilledButton
                  SizedBox(height: 10,),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainNavBarHolderScreen()));
                    },
                        child: Text('Login')),
                  ),

                  SizedBox(height: 10,),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordEmail()));
                  }, child: Text('Forgot Password?')),

                  SizedBox(height: 10,),
                  RichText(text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),

                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold
                        ),

                        // 2. recognizer for sign up and call method _onTapSignUp()
                        recognizer: TapGestureRecognizer()
                          ..onTap = onTapSignUp,

                      ),

                    ]

                  ),),

                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
