import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fruit_hup/constants.dart';
import 'package:fruit_hup/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

class PushNotificationService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final CollectionReference notifications = FirebaseFirestore.instance
      .collection(AppConstants.notificationCollection);

  Future<void> init() async {
    await messaging.requestPermission();

    final token = await messaging.getToken();

    print('the token is this $token');
    handleBackgroundMessage();
  }

  void handleMessage(RemoteMessage? message) async {
    if (message == null) return;
    print('**********************************');
    log(message.data.toString());
    log(message.data.toString());
    GoRouter.of(navigatorKey.currentContext!)
        .go(AppRouter.notificationView, extra: message);
  }

  Future handleBackgroundMessage() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(saveNotificationToFirestore);
    FirebaseMessaging.onMessage.listen(saveNotificationToFirestore);
  }

  void saveNotificationToFirestore(RemoteMessage message) async {
    await notifications.add({
      'title': message.notification?.title,
      'body': message.notification?.body,
      'data': message.data,
      "time": DateTime.now().hour
    });
  }
}
