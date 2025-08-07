

import 'dart:convert';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

class AccessTokenFirebase {
  static String scopes = 'https://www.googleapis.com/auth/firebase.messaging';

  static Future<String> getAccessToken() async {
    final client = await clientViaServiceAccount(
      ServiceAccountCredentials.fromJson(
        {
          "type": "service_account",
          "project_id": "grocery-app-4ca36",
          "private_key_id": "90ad074a20c98880942382f6308dcf493c4aa57e",
          "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDQBPqVXMtKs0vW\nyH+osIytiskPvVAawU3WIBNUnFr9ZuIg7cIuSUL8CnpvoesD3AGsuvShTxESB6F+\nk0nrHuiewmDhkFPVcBshbRxdh4aw4XWU93mvRz9jH/G3Qar555Htn8AWnt/Y4I9U\n1wPVp4Fe2/cNF+1gPWm3RnhqvTrqBHgcXWdnszoj1n5Xf7luI2dcVmvbDiuWcogG\nyMKRg2fHItJIjPaHc74mtcEjm/IXfptmOnTrN13rvosk2V81i7KYjI4+kuNgq+NL\nW+qQ1p54m78fcqGIso7Kr64WU3je9TgYtnmLokIe5JifRVbo+RS2V+/5x6zwb8qE\nMz3mOJS1AgMBAAECggEAIfkSMLcXN3O5WNJlcPgmfYg7RpAJR1lXHDegWJLxlE2L\ndEvISRVrdGzEqrsjvf1eI6bj4X1fgRWQdTLaYWUqohUGTAhtfKACuk6O0aKa54Pm\n12WkcLEe49I5gI+fvBErBscukLMxRUMFfZphFLF24jZj7nZALRXSkF1YuLv/ZWz6\ndQ4d3eG90LK8m4swgNlw8S8GTiIONN2LrDWLWZEhzm+m0UhphK24hW4vs1ApLGRR\nHuQyGeBsl68eI3WJL4iI/4Us/WMebmEZioRHjnlsc+79PiMWGq5jyu8lULGHVS3B\n1TuoMN2mtV3JpYgZqK6RtylPAaku2PB5dECcMpTZIQKBgQDyo2G0HrOJSi+ngoOA\n0Vnx7bZ1nPGH2M1UmTZUe40ERMZuBiNWrQw0g/yY3hYnHR5jBHr/dpRICYgVnIYP\nzjNnC1QpG44k8fpyyD9UiBKndPMIkQaizuqBc0L/vZohXxty2eTgh9CswDVZYKLt\nfv0pMDr4Y1lb8e1Gsd9yqrZLFQKBgQDbeY4zI4E5z9mfJnRm3m5fQ164TBtyksW1\n4epvTY3h1hlFkXlTSiAjQdOdCgMWZWcskT3Mt/WlI0IzezC3INdmgwh2lVycYp0i\nkppTukFWshBz/VbsaoR3bxGkrnxQgSJU0z93ezugxC/Ag36MVuXmZmEhHCVRjB7T\nz0/nBUMLIQKBgDI/a4hlo0CXQG8sNBeFQ186n0KUEeDUIRGX+Qxd2cI8i+tVEhRt\nGc32V2VA+M141kYjM2WcJPEWKDxxgcHcLgD086Tfs/wqsHb8yUC0PUi4i2wGvJ0S\nxLWyLPnRRg4LKCAMx71H4wsjcujjflo4pizVdCDkUikcXMr7Iw8YE1BRAoGAX6db\nzXf081BeZZmp88ePzR8cojAxaj8DwmCi/z2Kz9mzC/n6Kc3NsfAXnYLmk5VAYVEv\n4RBwFDgIu00+jyHWH0yOnLg+M75bA91nO4Saw4E54IOSpdlKwI783oxZi/CsGNI1\nAAsKkufOdBYbSmj5K/CE9pxAu4jZSrE4/tPxQ2ECgYEAlrVWXFQVHA2wfFX5kvp+\nZ2hIGoyyx8Og2j2O8tpNfKFFjq6wosug017+jlijFLS6LD59JP9V4dZFttPrK011\nb2udOS6fIT7i1+fyCVasxCLqe38jNnMLGeM8eUuHmAY0TftUJQayDVYg4ZJpttPi\n5s667ZaMuZre2cCQSafD7lI=\n-----END PRIVATE KEY-----\n",
          "client_email":
          "firebase-adminsdk-62l5u@grocery-app-4ca36.iam.gserviceaccount.com",
          "client_id": "100761564182322512867",
          "auth_uri": "https://accounts.google.com/o/oauth2/auth",
          "token_uri": "https://oauth2.googleapis.com/token",
          "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
          "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-62l5u%40grocery-app-4ca36.iam.gserviceaccount.com",
          "universe_domain": "googleapis.com",
        },
      ),
      [scopes],
    );
    return client.credentials.accessToken.data;
  }
}


class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  PushNotificationService notificationService = PushNotificationService();

  @override
  void initState() {
    // TODO: implement initState
    notificationService.requestNotificationPermission();
    notificationService.isTokenRefrech();
    // notificationService.inilocationNatification();
    notificationService.setUpIntereactionMessage(context);
    notificationService.firebaseInt(context);
    notificationService.getDeviceToken().then((value) {
      print("Devnice Token: ");
      print(value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mian Page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            notificationService.getDeviceToken().then((value) async {
              final accessToken = await  AccessTokenFirebase.getAccessToken();

              //grocery-app-4ca36
              final url = Uri.parse(
                'https://fcm.googleapis.com/v1/projects/grocery-app-4ca36/messages:send',
              );

              var token = 'fElhQ7BPQsijB92J98aG81:APA91bFLuAm-QXnzD_pHOZCj_zpljbsBquFiNHhKIQu836WVOJedGSH6BV6HtbtjtY_gmEr6gpSaQZSCSGNUEV26eCGIIlbmF3m6XdSOEclODxwxInS7dQY';
              final body = {
                "message": {

                  'token': token,
                  'notification': {
                    'title': "Hello Bangladesh",
                    'body': "How are you",
                  },
                  'data':{
                    'type':'message',
                    'id':'jasim12345'
                  }
                },

              };

              // Send request
              final response = await http.post(
                url,
                headers: {
                  'Content-Type': 'application/json',
                  'Authorization': 'Bearer $accessToken',
                },
                body: jsonEncode(body),
              );
              print('FCM v1 Status: ${response.statusCode}');
              print('FCM v1 Body: ${response.body}');
            });

          },
          child: Text("Hello BAngladesh"),
        ),
      ),
    );
  }
}

class PushNotificationService {
  final FirebaseMessaging message = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  void requestNotificationPermission() async {
    NotificationSettings settings = await message.requestPermission(
      sound: true,
      provisional: true,
      criticalAlert: true,
      carPlay: true,
      badge: true,
      announcement: true,
      alert: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("user pramission graned");
    } else if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("user granted provitional permission");
    } else {
      print("user denied permission");
    }
  }

  Future<String?> getDeviceToken() async {
    var token = await message.getToken();
    return token;
  }

  void isTokenRefrech() {
    message.onTokenRefresh.listen((event) {
      event.toString();
      print("Hellow Prin");
    });
  }

  void inilocationNatification(
      BuildContext context,
      RemoteMessage message,
      ) async {
    var androidInitSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    InitializationSettings initSettings = InitializationSettings(
      android: androidInitSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (details) {
        handMessage(context, message);
      },
    );
  }

  void firebaseInt(BuildContext context) {
    FirebaseMessaging.onMessage.listen((event) {
      print("📲 Foreground: ${event.notification?.title.toString()}");
      print("📲 Foreground: ${event.notification?.body.toString()}");
      print("📲 Foreground: ${event.data.toString()}");
      print("📲 Foreground: ${event.data["type"].toString()}");
      print("📲 Foreground: ${event.data["id"].toString()}");
      _showLocalNotification(event);
      inilocationNatification(context, event);
    });
  }

  void _showLocalNotification(RemoteMessage message) {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      Random.secure().nextInt(10000).toString(),
      'High Importance Notifications',
      importance: Importance.max,
    );
    AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      channelDescription: "You channel Description",
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
    );

    Future.delayed(Duration.zero, () {
      flutterLocalNotificationsPlugin.show(
        0,
        message.notification?.title,
        message.notification?.body,
        platformDetails,
      );
    });
  }

  void handMessage(BuildContext context, RemoteMessage message) {
    if (message.data['type'] == "jasim") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MassageScreen(id: message.data['id']),
        ),
      );
    }
  }

  Future<void> setUpIntereactionMessage(BuildContext context) async {
    RemoteMessage? message = await FirebaseMessaging.instance
        .getInitialMessage();

    if (message != null) {
      handMessage(context, message);
    }
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handMessage(context, event);
    });
  }
}

class MassageScreen extends StatefulWidget {
  const MassageScreen({super.key, required this.id});

  final String id;

  @override
  State<MassageScreen> createState() => _MassageScreenState();
}

class _MassageScreenState extends State<MassageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.id)),
      body: Center(
        child: TextButton(onPressed: () {}, child: Text(widget.id)),
      ),
    );
  }
}



// 5q