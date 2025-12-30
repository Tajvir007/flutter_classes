import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/login_page.dart';

import '../widgets/background_page_logo.dart';
import '../widgets/background_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  // 1. Controller for text field
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
 // final TextEditingController emailController = TextEditingController();

  /**
   * 1. GlobalKey<FormState> = এটা একটা special key যেটা দিয়ে তুমি Form widget-এর state ধরতে পারো।
   * 2. GlobalKey → widget এর state globally access করতে দেয়
   * 3. <FormState> → specifically Form widget এর state
   * ********** এই key দিয়ে আমরা Form এর ভিতরের সব input control করব ************
   */
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreen(
        child: BackgroundPageLogo(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(

                key: _formKey,

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
                      validator: (String ? value){
                        if(value == null || value.isEmpty){
                          return 'Email is required';
                        }

                        final emailRegularExpression = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                        if( ! emailRegularExpression.hasMatch(value)){
                          return 'please enter valid email';
                        }
                        return null;

                      },
                    ),

                    SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'First Name',
                        labelText: 'First Name',
                      ),

                      validator: (String ? value){
                        if(value == null || value.isEmpty){
                          return 'Enter your first name';
                        }
                        if(value.trim().length < 2){
                          return 'First name must be at least 2 characters';
                        }
                        return null;

                      },

                    ),

                    SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                        labelText: 'Last Name',
                      ),

                      validator: (String ? value){
                        if(value == null || value.isEmpty){
                          return 'Enter your last name';
                        }
                        if(value.trim().length < 2){
                          return 'Last name must be at least 2 characters';
                        }
                        return null;

                      },

                    ),

                    SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Phone',
                        labelText: 'Phone',
                      ),

                      validator: (String ? value){
                        if(value == null || value.isEmpty){
                          return 'Enter your phone number';
                        }
                        if(value.trim().length != 11){
                          return 'Enter a valid phone number';
                        }
                        return null;

                      },

                    ),

                    SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                      ),
                      obscureText: true,

                      validator: (String ? value){
                        if(value == null || value.isEmpty){
                          return 'Enter your Password';
                        }
                        if(value.length <= 6){
                          return 'Password must be at least 6 characters';
                        }
                        return null;

                      },

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

                          if(_formKey.currentState!.validate()){

                          }

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
      ),
    );
  }
}
