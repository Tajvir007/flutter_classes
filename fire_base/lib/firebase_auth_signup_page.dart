import 'package:fire_base/service/auth_service.dart';
import 'package:flutter/material.dart';

class FirebaseAuthSignUpPage extends StatefulWidget {
  const FirebaseAuthSignUpPage({super.key});

  @override
  State<FirebaseAuthSignUpPage> createState() => _FirebaseAuthSignUpPageState();
}

class _FirebaseAuthSignUpPageState extends State<FirebaseAuthSignUpPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Create Account',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20,),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () async {
                      await auth.signUp(
                          emailController.text,
                          passwordController.text
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Account created'))
                      );

                      emailController.clear();
                      passwordController.clear();

                    }, child: Text('Sign Up')),
              ),
              SizedBox(height: 10,),

              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('Login')),

            ],
          ),
        ),
      ),
    );
  }
}
