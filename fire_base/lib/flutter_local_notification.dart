import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as timeZone;

/**
 * 1. Flutter local notification plugin এর object তৈরি করছি
 * 2. এটা main controller. সব notification show / schedule / cancel — সব এই object দিয়ে হবে।
 */
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

// app start হলে এই function call করা উচিত
Future<void> initializeNotifications() async {

  // ডিভাইসের timezone load করছি.  scheduled notification এর জন্য দরকার
  timeZone.initializeTimeZones();

  /**
   * 1. Android notification icon সেট করছি.  @mipmap/ic_launcher = app icon
   * 2. status bar এ যেই icon দেখাবে।
   */
  AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
  DarwinInitializationSettings iosSettings = DarwinInitializationSettings(); // iOS notification basic permission setup. Darwin = iOS / macOS framework name।

  // Android + iOS দুইটার settings একসাথে merge করছি
  InitializationSettings settings = InitializationSettings(
    android: androidInitializationSettings,
    iOS: iosSettings
  );

  /**
   * 1. plugin start করছি
   * 2. background notification click করলে notificationTapBackground call হবে
   * 3. এইটা core line। Without this → notification কাজ করবে না।
   */
  await flutterLocalNotificationsPlugin.initialize(
      settings: settings,
    onDidReceiveBackgroundNotificationResponse: notificationTapBackground
  );

}

/**
 * ************** কেন @pragma দরকার? ****************
 * 1. Dart VM কে বলছি এই function tree-shaking এ remove করো না
 * 2. background isolate থেকে call হবে
 */
@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse response){
  print('Notification Clicked');
}

