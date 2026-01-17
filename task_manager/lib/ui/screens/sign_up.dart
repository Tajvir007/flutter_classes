import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/data/services/api_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/providers/network_provider.dart';
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
  // 2. Assign controllers to all text field
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
 // final TextEditingController emailController = TextEditingController();

  bool _signUpInProgress = false;

  // By Controller
  // 4. Create a function to call api caller and sign up
  /**
  Future<void> _signUp()async {

    setState(() {
      _signUpInProgress = true;
    });

    // Create a request body to send data to api caller and store in requestBody variable
      Map<String, dynamic> requestBody = {
        "email": _emailController.text,
        "firstName": _firstNameController.text,
        "lastName": _lastNameController.text,
        "mobile": _phoneController.text,
        "password": _passwordController.text,

      };

      // 5. Call api. Create response object to store the response from api caller and store in response variable
      final ApiResponse response = await ApiCaller.postRequest(
          url: Urls.registrationUrl,
          body: requestBody,
      );

      if(response.isSuccessful){
        setState(() {
          _signUpInProgress = false;
        });
        _clearTextFields();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Sign up successful..!"),
          backgroundColor: Colors.green,
            duration: Duration(seconds: 5),
          )
        );
      }else{
        setState(() {
          _signUpInProgress = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response.responseData['data']),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 5),
            )
        );
      }

  }
**/

  Future<void> _signUp()async {

    final networkProvider = Provider.of<NetworkProvider>(context, listen: false);
    final result = networkProvider.register(
        email: _emailController.text.trim(),
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        phone: _phoneController.text.trim(),
        password: _passwordController.text.trim()
    );

    if(result != null){
      _clearTextFields();

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Sign up successful..!"),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 5),
          )
      );

      Navigator.pop(context);

    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(networkProvider.errorMessage ?? 'Something wrong'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 5),
          )
      );
    }

  }

  // 6. Create a function to clear all text field
  _clearTextFields(){
    _emailController.clear();
    _firstNameController.clear();
    _lastNameController.clear();
    _phoneController.clear();
    _passwordController.clear();
  }


  /**
   * 1. GlobalKey<FormState> = এটা একটা special key যেটা দিয়ে তুমি Form widget-এর state ধরতে পারো।
   * 2. GlobalKey → widget এর state globally access করতে দেয়
   * 3. <FormState> → specifically Form widget এর state
   * ********** এই key দিয়ে আমরা Form এর ভিতরের সব input control করব ************
   */
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // 3.1 Create a global key


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreen(
        child: BackgroundPageLogo(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(

                key: _formKey, // 3.2 Assign global key to form key

                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Text('Sign UP',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),

                    SizedBox(height: 10,),
                    TextFormField(
                      controller: _emailController,
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
                      controller: _firstNameController,
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
                      controller: _lastNameController,
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
                      controller: _phoneController,
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
                      controller: _passwordController,
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
                        child: Visibility(

                          visible: !_signUpInProgress,
                          replacement: Center(child: CircularProgressIndicator()),

                          child: FilledButton(onPressed: (){

                            if(_formKey.currentState!.validate()){
                              _signUp();
                            }

                          }, child: Text('Sign UP')),
                        )),

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


  // 7. Dispose is use to Controller close, Stream cancel, Animation dispose. It will  avoid memory leak
  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

}
