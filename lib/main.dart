import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:oriens_eam/features/0_auth/auth_presentation/auth_bloc/auth_bloc.dart';
import 'package:oriens_eam/features/13_parts/asset_parts/presentation/bloc/asset_parts_bloc.dart';
import 'package:oriens_eam/features/13_parts/workorder_parts/presentation/bloc/workorder_parts_bloc.dart';
import 'package:oriens_eam/features/2_workorder/presentation/bloc/local/local_workorder_bloc.dart';
import 'package:oriens_eam/features/2_workorder/presentation/bloc/workorder_bloc.dart';
import 'package:oriens_eam/features/3_1_asset_workorder/presentation/bloc/asset_work_order_bloc.dart';
import 'package:oriens_eam/features/7_assets/asset_files/presentation/bloc/asset_file_bloc.dart';
import 'package:oriens_eam/features/connectivity_check/internet_connectivity_bloc.dart';

import 'core/dependency_injection/di_container.dart';
import 'core/utils/cache/auth_cache_manager.dart';
import 'core/utils/preference_manager.dart';
import 'features/0_auth/auth_domain/auth_service.dart';
import 'features/3_workorder_details/3_wod_presentation/bloc/work_order_status_update_cubit.dart';
import 'oriens_eam_app.dart';

// FLUTTER NOTIFICATION INSTANCE
FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

String fcmToken = "Getting Firebase Token";

Future<void> myBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  return _showNotification(message);
}

// MAIN FUNCTION
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  requestingPermissionForIOS();
  FirebaseMessaging.onBackgroundMessage(myBackgroundHandler);

  await initializeDependencies();
  await SharedPreferenceUtils.init();
  AndroidInitializationSettings androidSettings =
      const AndroidInitializationSettings("@mipmap/ic_launcher");

  DarwinInitializationSettings iosSettings = const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestCriticalPermission: true,
      requestSoundPermission: true);

  InitializationSettings initializationSettings =
      InitializationSettings(android: androidSettings, iOS: iosSettings);

  bool? initialized = await notificationsPlugin.initialize(
      initializationSettings, onDidReceiveNotificationResponse: (response) {
    log(response.payload.toString());
  });

  var initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  FirebaseMessaging.onMessage.listen((message) {
    print(message);
    if (message.notification?.body != null) _showNotification(message);
  });

  getTokenz();

  print("Notifications: $initialized");

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => InternetConnectivityBloc(),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            AuthService(sl()),
            AuthCacheManager(),
          ),
        ),
        BlocProvider<WorkorderBloc>(
          create: (context) => sl()..add(const GetWorkOrderEvent()),
        ),
        BlocProvider<LocalWorkorderBloc>(
          create: (context) => sl()..add(const GetSavedWorkOrders()),
        ),
        BlocProvider(
          create: (BuildContext context) => AssetWorkOrderBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => AssetFileBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => AssetPartsBloc(),
        ),
        BlocProvider(
          create: (context) => WorkOrderStatusUpdateBloc(),
        ),
        BlocProvider(
          create: (context) => WorkOrderPartsBloc(),
        )
      ],
      child: const OriensEAMApp(),
    ),
  );
}

Future _showNotification(RemoteMessage message) async {
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    importance: Importance.max,
  );

  await notificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  print("message.data${message.notification}");

  Map<String, dynamic> data = message.data;
  AndroidNotification? android = message?.notification?.android!;
  if (message?.notification != null) {
    notificationsPlugin.show(
      0,
      message.notification?.title!,
      message.notification?.body!,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          icon: android?.smallIcon,
          // other properties...
        ),
        // iOS: IOSNotificationDetails(presentAlert: true, presentSound: true),
      ),
      payload: 'Default_Sound',
    );
  }
}

requestingPermissionForIOS() async {
  NotificationSettings settings = await _firebaseMessaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true, // Required to display a heads up notification
    badge: true,
    sound: true,
  );
}

getTokenz() async {
  String? token = await _firebaseMessaging.getToken();
  fcmToken = token!;
  print("fcmToken ${fcmToken}");
}

Future selectNotification(String payload) async {
  await notificationsPlugin.cancelAll();
}
