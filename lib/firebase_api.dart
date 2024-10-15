import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final _firebaseMessing = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMessing.requestPermission();
    final fcmToken = await _firebaseMessing.getToken();
    print('Token ${fcmToken}');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    print('title ${message.notification?.title}');
    print('body ${message.notification?.body}');
    print('payload ${message.data}');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received a message: ${message.messageId}');
    });
  }
}
