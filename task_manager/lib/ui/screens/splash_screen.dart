import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/providers/auth_provider.dart';
import 'package:task_manager/ui/controller/auth_controller.dart';
import 'package:task_manager/ui/widgets/background_screen.dart';
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

    /**
     * ******** By  Auth Controller ************

    await AuthController.getUserData();

    // Check user logged in or not
    final bool isLoggedIn = await AuthController.isUserLoggedIn();
        **/


    // By Auth Provider
    final authProvider = Provider.of<AuthProvider>(context, listen: false); // এই লাইনে তুমি Widget tree থেকে AuthProvider-এর instance নিয়ে আসছো।
    authProvider.loadUserData();

    if(authProvider.isLoggedIn){
      Navigator.pushReplacementNamed(context, 'mainNavBarHolderScreen');
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage() ));
    }

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
