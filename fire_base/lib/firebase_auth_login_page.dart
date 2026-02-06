import 'package:fire_base/service/auth_service.dart';
import 'package:fire_base/task_manager.dart';
import 'package:flutter/material.dart';

import 'firebase_auth_signup_page.dart';

class FirebaseAuthLoginPage extends StatefulWidget {
  const FirebaseAuthLoginPage({super.key});

  @override
  State<FirebaseAuthLoginPage> createState() => _FirebaseAuthLoginPageState();
}

class _FirebaseAuthLoginPageState extends State<FirebaseAuthLoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome Back',
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
                    final user = await auth.logIn(
                          emailController.text,
                          passwordController.text
                      );

                    if(user!.emailVerified){

                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TaskManager()));

                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please verify your email'))
                      );
                    }


                      emailController.clear();
                      passwordController.clear();
                    }, child: Text('Login')),
              ),
              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: (){}, child: Text('Forgot Password?')),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FirebaseAuthSignUpPage()));
                  }, child: Text('Create Account')),
                ],
              ),
              SizedBox(height: 10,),

              ElevatedButton.icon(onPressed: () async {
                final user = await auth.signInWithGoogle();

                if(user != null){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TaskManager()));
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Login failed'))
                  );
                }

              }, label: Icon(Icons.login), icon: Text('Login with Google'),)

            ],
          ),
        ),
      ),
    );
  }
}
