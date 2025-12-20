import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/background_page_logo.dart';
import 'package:task_manager/ui/screens/background_screen.dart';
import 'package:task_manager/ui/screens/forgot_password_email.dart';
import 'package:task_manager/ui/utils/asset_paths.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

                  Text('Get Started With',
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
                    child: FilledButton(onPressed: (){},
                        child: Icon(Icons.arrow_circle_right_outlined)),
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
                      ),
                    ]

                  ),)

                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
