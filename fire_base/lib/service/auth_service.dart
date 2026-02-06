import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign Up => Email + Password দিয়ে নতুন account তৈরি করার function
  Future<User?> signUp(String email, String password) async {

    // Firebase Authentication এ user create করা
    final result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    return result.user;

  }

  // Login
  Future<User?> logIn(String email, String password) async {

    // Firebase Authentication এ login request পাঠানো
    final result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    print(result.user);
    return result.user;

  }


  // Google Sign in
  /**
   * 1️⃣ Google login popup আসে
   * 2️⃣ User Google account select করে
   * 3️⃣ Google থেকে token আসে
   * 4️⃣ সেই token দিয়ে Firebase authenticate হয়
   * 5️⃣ Firebase থেকে User object পাওয়া যায়
   */
  Future<User?> signInWithGoogle() async {

    // Google Sign In popup খুলবে এবং user select করলে account return করবে
    final googleUser = await GoogleSignIn().signIn();
    print(googleUser);

    // যদি user login cancel করে → null return করবে
    if(googleUser == null) return null;

    // Google account থেকে authentication token collect করা
    final googleAuth = await googleUser.authentication;

    // Google token দিয়ে Firebase credential তৈরি করা
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,    // Google access token
      idToken: googleAuth.idToken,            // Google id token
    );

    // Firebase এ credential পাঠিয়ে sign in করা
    final result = await _auth.signInWithCredential(credential);
    result.user!.sendEmailVerification();
    return result.user;

  }

}