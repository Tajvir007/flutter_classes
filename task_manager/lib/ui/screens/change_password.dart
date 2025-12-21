import 'package:flutter/material.dart';

import '../widgets/background_page_logo.dart';
import '../widgets/background_screen.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
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

                  Text('Change Password',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'New Password',
                      labelText: 'New Password',
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

                      },
                          child: Icon(
                              Icons.arrow_circle_right_outlined))),
                  

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
