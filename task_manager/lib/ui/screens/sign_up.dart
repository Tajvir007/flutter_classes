import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/login_page.dart';

import 'background_page_logo.dart';
import 'background_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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

                  Text('Sign UP',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                    ),
                  ),

                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'First Name',
                      labelText: 'First Name',
                    ),
                  ),

                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                      labelText: 'Last Name',
                    ),
                  ),

                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Phone',
                      labelText: 'Phone',
                    ),
                  ),

                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                    ),
                  ),

                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      labelText: 'Confirm Password',
                    ),
                  ),

                  SizedBox(height: 10,),
                  SizedBox(
                      width: double.infinity,
                      child: FilledButton(onPressed: (){

                      }, child: Text('Sign UP'))),

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

                          // 2. recognizer for sign up and call method _onTapSignUp()
                          recognizer: TapGestureRecognizer()
                            ..onTap = (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                            }

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
