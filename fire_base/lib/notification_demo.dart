import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as timeZone;

import 'flutter_local_notification.dart';

class NotificationDemo extends StatelessWidget {
  const NotificationDemo({super.key});

  Future instantNotification() async {

    // notification এর full config বানাচ্ছি
    final details = NotificationDetails(
      // Android notification settings
      android: AndroidNotificationDetails(
          'instant_channel',       // channel unique id. Android 8+ এ notification দেখাতে channel লাগে
          'instant_notification',  // user setting এ যেই নামে দেখাবে
          importance: Importance.max,   // notification কতটা important. max দিলে popup + sound সব হবে
        priority: Priority.high    // immediately show করবে (high priority)
      ),
    );

    // notification display command
    await flutterLocalNotificationsPlugin.show(
      id: 0,          // notification unique id.  same id দিলে আগেরটা replace হবে
      title: 'Instant Notification',
      body:  'This is an instant notification',
      notificationDetails: details    // উপরে বানানো config pass করছি
    );

  }

  Future scheduleNotification() async {

    await flutterLocalNotificationsPlugin.zonedSchedule(
        id: 1,
        title: 'Schedule Notification',
        body: 'This is a schedule notification',
        scheduledDate: timeZone.TZDateTime.now(timeZone.local).add(Duration(seconds: 3)),
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
          'meeting_channel',
          'meeting_notification',
            priority: Priority.high,
            importance: Importance.max,
            icon: '@mipmap/ic_launcher',
          ),
        ),
       // androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      androidScheduleMode: AndroidScheduleMode.inexact,
    );

  }


  Future dailyNotification() async {

    final now = DateTime.now();
    final scheduleTime = timeZone.TZDateTime(
      timeZone.local,
      now.year,
      now.month,
      now.day,
      now.hour,
        (now.minute+1) % 60,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
        id: 2,
        title: 'Daily Notification',
        body: 'This is a daily notification',
        scheduledDate: scheduleTime,
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
          'daily_channel',
          'daily_notification',
            priority: Priority.high,
            importance: Importance.max
          )
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Demo'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              instantNotification();
            }, child: Text('Instant notification')),

            ElevatedButton(onPressed: (){
              scheduleNotification();
            }, child: Text('Schedule notification')),

            ElevatedButton(onPressed: (){
              dailyNotification();
            }, child: Text('Daily notification')),
          ],
        ),
      ),
    );
  }
}
