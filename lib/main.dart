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


