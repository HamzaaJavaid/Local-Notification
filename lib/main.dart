import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notifications_two_by_hamza/notificatios.dart';
import 'package:timezone/data/latest_10y.dart';
import 'dart:async';


void main(){

  initializeTimeZones();
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:PageOne()));
}

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  NotificationServices notificationServices = NotificationServices();



  void checkNotificationsOnStart()async{

    NotificationAppLaunchDetails? notificationAppLaunchDetails=
    await notificationServices.flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    if(notificationAppLaunchDetails!=null){
      if(notificationAppLaunchDetails.didNotificationLaunchApp){
        NotificationResponse? notificationResponse = notificationAppLaunchDetails.notificationResponse;
     if(notificationResponse!=null){
       print(notificationResponse.payload);
     }
      }
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationServices.initializeNotifications(context);
    checkNotificationsOnStart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Local Notifications'),centerTitle: true,),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/noti.PNG"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){

                  notificationServices.simpleNotifications("Simple Notification", "This is Simple Notification");
                },
                child: Container(
                decoration:  BoxDecoration(
                  color: Colors.blue.withOpacity(0.7),
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                ),
                height: MediaQuery.of(context).size.height/13,
                width: MediaQuery.of(context).size.width/2.4,
                child: Center(child: Text('Simple Notification',style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),)),
              ),),
              InkWell(onTap: (){
                notificationServices.bigIconNotifications("Big Icon Notification", "This Notification Contain Big Icon on Side");
              },child: Container(
                decoration:  BoxDecoration(
                  color: Colors.blue.withOpacity(0.7),
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                ),
                height: MediaQuery.of(context).size.height/13,
                width: MediaQuery.of(context).size.width/2.4,
                child: Center(child: Text('Big Icon Notification',style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),)),
              ),),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(onTap: (){
                notificationServices.pictureNotifications("Picture Notification", "This is Picture Notification");
              },child : Container(
                decoration:  BoxDecoration(
                  color: Colors.blue.withOpacity(0.7),
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                ),
                height: MediaQuery.of(context).size.height/13,
                width: MediaQuery.of(context).size.width/2.4,
                child: const Center(child: Text('Picture Notification',style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),)),
              ),),
              InkWell(onTap: () {
                notificationServices
                .payloadNotifications("Payload Notification", "This Is the Payload Notifications");
              },child : Container(
                decoration:  BoxDecoration(
                  color: Colors.blue.withOpacity(0.7),
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                ),
                height: MediaQuery.of(context).size.height/13,
                width: MediaQuery.of(context).size.width/2.4,
                child: const Center(child: Text('Payload Notification',style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),)),
              ),),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(onTap: (){
                notificationServices.zonedScheduleNotifications("Zoned Schedule ", "This notification is Zoned Schedule");

              },child : Container(
                decoration:  BoxDecoration(
                  color: Colors.blue.withOpacity(0.7),
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                ),
                height: MediaQuery.of(context).size.height/13,
                width: MediaQuery.of(context).size.width/2.4,
                child: const Center(child: Text('Zone Schedule Notification',
                  textAlign: TextAlign.center,
                  style: TextStyle(

                    color: Colors.white,
                    fontSize: 18
                ),)),
              ),),

            ],
          ),
        ],
      )
    );
  }
}


class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page'),centerTitle: true,),
    );
  }
}




/*
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notifications_two_by_hamza/notificatios.dart';
import 'package:timezone/data/latest_10y.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main(){

  initializeTimeZones();
  runApp (MaterialApp(

    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  notificat notif = notificat();


  void checkNotificationPayload()async{


NotificationAppLaunchDetails? notificationApplaunchDetails = await notif.flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
if(notificationApplaunchDetails!=null){
  if(notificationApplaunchDetails.didNotificationLaunchApp){
    NotificationResponse? notificationResponsee= notificationApplaunchDetails.notificationResponse;
  if(notificationResponsee!=null){
    String? payload_data = notificationResponsee.payload;
    print("Payload is = $payload_data");
 //   Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondPage()));
  }
  }
}





  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    notif.IntializeNotifications(context);
    checkNotificationPayload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Notification By Hamza Javaid'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[

          Image.asset("assets/noti.PNG"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap:(){
                  notif.showZonedNotifications("Hamza Javaid", "A Big Hello from Hamza Javaid");
                  print('Zoned Is pressed');
                },
                child:Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.lightBlueAccent
                    ),

                    height: MediaQuery.of(context).size.height/12,
                    width: MediaQuery.of(context).size.width/3,
                    child: Center(
                      child:Text('Zoned',
                        textAlign: TextAlign.center,
                      ),
                    )
                ),
              ),
              InkWell(
                onTap:(){

                  Timer(Duration(seconds: 5), () {
                    notif.showWithPayload("This is payload one", "This is real paylaod");

                  });
                  print('Payload Is pressed');
                },
                child:Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.lightBlueAccent
                    ),

                    height: MediaQuery.of(context).size.height/12,
                    width: MediaQuery.of(context).size.width/3,
                    child: Center(
                      child:Text('Payload',
                        textAlign: TextAlign.center,
                      ),
                    )
                ),
              ),
            ],
          ),

        ]
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Text("Second Page"),
      ),
    );
  }
}


*/
