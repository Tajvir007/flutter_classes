
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService{

  /**
   * 1. FirebaseMessaging-এর একটা single instance নেওয়া হচ্ছে
   * 2. এই instance দিয়েই notification, token, permission সব handle হবে
   */
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  static Future<void> initialize() async {
    await Firebase.initializeApp(); //Firebase অ্যাপ initialize করা হচ্ছে. এটা না করলে Firebase-এর কোনো সার্ভিস কাজ করবে না

    // ইউজারের কাছে notification permission চাওয়া হচ্ছে
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      sound: true,
      badge: true
    );
    
    print('Permission: ${settings.authorizationStatus}');

    /**
     * 1. এই ডিভাইসের unique FCM token নেওয়া হচ্ছে
     * 2. এই token দিয়েই backend থেকে notification পাঠানো হয়
     */
    String ? deviceToken = await _firebaseMessaging.getToken();
    print("Device token: ${deviceToken}");

  }

}