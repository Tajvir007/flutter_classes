import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/background_screen.dart';
import 'package:task_manager/ui/screens/login_page.dart';
import 'package:task_manager/ui/utils/asset_paths.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  /// 1. Create a method _moveToNextScreen() to Navigate next screen after 3 second
  /// 2. Then call that method in initState() method

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage() ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreen(
        child: Center(child: Image.asset(AssetPaths.logoImage,
          height: 200,
          width: 200,
        )),
      )
    );
  }
}
