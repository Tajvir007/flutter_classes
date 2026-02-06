// import 'package:fire_base/task_manager.dart';
// import 'package:fire_base/voting_page.dart';
import 'package:flutter/material.dart';

import 'firebase_auth_login_page.dart';
import 'notification_demo.dart';

class FirebaseFirestore extends StatelessWidget {
  const FirebaseFirestore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Voting App',

      home: FirebaseAuthLoginPage(),

    );
  }
}
