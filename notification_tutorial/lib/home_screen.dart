import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:notification_tutorial/notification_services.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    super.initState();
    notificationServices.requestNotificationPermission();

    notificationServices.firebaseInit(context);

    notificationServices.setupInteractMessage(context);

    notificationServices.isTokenRefresh();

    notificationServices.getDeviceToken().then((value) {
      print("Device Token : $value");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Tutorial'),
      ),
      body: Center(
          child: TextButton(
        onPressed: () {
          notificationServices.getDeviceToken().then((value) async {
            var data = {
              'to': value.toString(),
              'priority': 'high',
              'notification': {
                'title': 'Hirdesh',
                'body': 'Hello...',
              },
              'data': {
                'type': 'String',
                'id': '1234',
              }
            };
            await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
                body: jsonEncode(data),
                headers: {
                  'Content-Type': 'application/json; charset=UTF-8',
                  'Authorization':
                      'key=AAAAzP_KAlg:APA91bF9-WeB4re_ncuav42uitpbdtI6OAAlGN9W3wzmUn5JXqYIRhw74ck44rb-RlZqBDgHkaCejkLqQGj2UyGku-uu2nM5_bAQtbihxiyoki1cecLkCq18ANACom1znip1aF89L-Tf'
                });
          });
        },
        child: Text('Send Notification'),
      )),
    );
  }
}
