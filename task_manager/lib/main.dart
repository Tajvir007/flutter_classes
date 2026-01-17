import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/providers/auth_provider.dart';
<<<<<<< HEAD
import 'package:task_manager/providers/network_provider.dart';
=======
>>>>>>> 6eb5b03cc9387587a6b515eb2a0946ffb49c7373

import 'app.dart';

void main() {
  runApp(
    MultiProvider(providers: [
<<<<<<< HEAD
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProvider(create: (_) => NetworkProvider()),
=======
      ChangeNotifierProvider(create: (_) => AuthProvider())
>>>>>>> 6eb5b03cc9387587a6b515eb2a0946ffb49c7373
    ],
    child: TaskManagerApp(),
    ),
  );
}


