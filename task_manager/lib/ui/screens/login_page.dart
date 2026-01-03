import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/models/user_model.dart';
import 'package:task_manager/ui/controller/auth_controller.dart';
import 'package:task_manager/ui/widgets/background_page_logo.dart';
import 'package:task_manager/ui/widgets/background_screen.dart';
import 'package:task_manager/ui/screens/forgot_password_email.dart';
import 'package:task_manager/ui/screens/main_nav_bar_holder_screen.dart';
import 'package:task_manager/ui/screens/sign_up.dart';

import '../../data/services/api_caller.dart';
import '../../data/utils/urls.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  // 1. Controller for text field
  // 2. Assign controllers to all text field
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _logInProgress = false;


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
              child: Form(

                key: _formKey,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text('Welcome Back',
                    style: Theme.of(context).textTheme.titleLarge,
                    ),

                    SizedBox(height: 30,),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        labelText: 'Email',
                      ),
                    ),

                    SizedBox(height: 10,),
                    TextFormField(
                      controller: _passwordController,
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

                        // Check if form is valid or not and call login function. Then navigate to main screen
                        if(_formKey.currentState!.validate()){

                          _logIn();

                        }

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
        ),
      )
    );
  }


  // 4. Create a function to call api caller and log in
  Future<void> _logIn()async {
    setState(() {
      _logInProgress = true;
    });

    // Create a request body to send data to api caller and store in requestBody variable
    Map<String, dynamic> requestBody = {
      "email": _emailController.text,
      "password": _passwordController.text,

    };

    // 5. Call api. Create response object to store the response from api caller and store in response variable
    final ApiResponse response = await ApiCaller.postRequest(
      url: Urls.loginUrl,
      body: requestBody,
    );

    if(response.isSuccessful){
      setState(() {
        _logInProgress = false;
      });
      _clearTextFields();

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Sign in successful..!"),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 5),
          )
      );

      // Save user data in shared preferences and navigate to main screen
      UserModel model = UserModel.fromJson(response.responseData['data']); // JSON → Dart object এ কনভার্ট করে API রেসপন্সের 'data' key থেকে ইউজারের তথ্য(JSON) নেওয়া হচ্ছে
      String token = response.responseData['token']; // backend থেকে token extract করা হচ্ছে, এটা দিয়েই future API call হবে
      await AuthController.saveUserData(model, token);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainNavBarHolderScreen()));

    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.responseData['data']),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 5),
          )
      );
    }

  }


  // . Create a function to clear all text field
  _clearTextFields(){
    _emailController.clear();
    _passwordController.clear();
  }


}
