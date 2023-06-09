

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notifications_two_by_hamza/main.dart';
import 'package:timezone/timezone.dart';


class NotificationServices{

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin= FlutterLocalNotificationsPlugin();

  AndroidInitializationSettings androidInitializationSettings = const AndroidInitializationSettings("notif");

  void initializeNotifications(BuildContext context){

    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,

    );

    flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
      onDidReceiveNotificationResponse: (response){
          print(response.payload.toString());

          if(response.payload=="Payload Triggred By Hamza"){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>const SecondScreen()));
          }
      }

    );

  }

  //Show Simple Notifications
  void simpleNotifications(String title , String body){

    AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
        "Simple_Notification",
        'Simple Notifications Channel',
        channelDescription: "This Channel is for Simple Notifications Only",
      importance: Importance.max,
      priority: Priority.max,
      channelShowBadge: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails
    );

    flutterLocalNotificationsPlugin.show(
        DateTime.now().millisecondsSinceEpoch.remainder(20),
        title,
        body,
        notificationDetails
    );


  }

  //Show Big Icon on Side Of Notification
  void bigIconNotifications(String title , String body){

    AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
      "Big Icon_Notification",
      'Big Icon Notifications Channel',
      channelDescription: "This Channel is for Big Icon Notifications Only",
      importance: Importance.max,
      priority: Priority.max,
      channelShowBadge: true,
      largeIcon: DrawableResourceAndroidBitmap('drawable/notif')
    );

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails
    );

    flutterLocalNotificationsPlugin.show(
        DateTime.now().millisecondsSinceEpoch.remainder(20),
        title,
        body,
        notificationDetails
    );


  }

  //Show Picture Notification
  void pictureNotifications(String title, String body){


    BigPictureStyleInformation bigPictureStyleInformation = const BigPictureStyleInformation(
      DrawableResourceAndroidBitmap('notif'),
      largeIcon:DrawableResourceAndroidBitmap('notif')
    );

    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        "Picture_Notification",
        "Picture Notification Channel",
      channelDescription: "This Channel is created for Picturee Notifications",
        channelShowBadge: true,
      styleInformation: bigPictureStyleInformation,
      priority: Priority.max,
      importance: Importance.max
    );


    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails
    );


    flutterLocalNotificationsPlugin.show(
        DateTime.now().millisecondsSinceEpoch.remainder(20),
        title,
        body,
        notificationDetails,
    );
  }

  //Show Payload Notifications
  void payloadNotifications(String title , String body){

    AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
        'Payload_Notifications',
        'Payload Notification Channel',
      channelDescription: "This Channel is for Payload Notifications Only",
      channelShowBadge: true,
      importance: Importance.max,
      priority: Priority.max,
      styleInformation: BigPictureStyleInformation(
        DrawableResourceAndroidBitmap('notif'),
        largeIcon: DrawableResourceAndroidBitmap("notif"),
      ),

    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails
    );

    flutterLocalNotificationsPlugin.show(
        DateTime.now().millisecondsSinceEpoch.remainder(20),
        title,
        body,
        notificationDetails,
      payload: "Payload Triggred By Hamza"
    );

  }

  //Show Zoned Schedule Notification
  void zonedScheduleNotifications(String  title , String body){


    BigPictureStyleInformation bigPictureStyleInformation = const BigPictureStyleInformation(
      DrawableResourceAndroidBitmap('notif'),
      largeIcon: DrawableResourceAndroidBitmap('notif'),
    );

    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        'Zoned_notification',
        'Zoned Notification',
      channelShowBadge: true,
      importance: Importance.max,
      priority: Priority.max,
      channelDescription: "This Notification Channel is created for Zoned Notification",
      styleInformation: bigPictureStyleInformation
    );

    NotificationDetails notificationDetails  = NotificationDetails(
      android: androidNotificationDetails
    );

    DateTime schedule = DateTime.now().add(const Duration(seconds: 3));

    flutterLocalNotificationsPlugin.zonedSchedule(
        DateTime.now().millisecondsSinceEpoch.remainder(20),
        title,
        body,
        TZDateTime.from(schedule, local),
        notificationDetails,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime
    );

  }



}











