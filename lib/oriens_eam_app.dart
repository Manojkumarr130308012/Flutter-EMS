import 'package:connection_notifier/connection_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/route/routes_config.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// The Widget that configures your application.
class OriensEAMApp extends StatelessWidget {
  const OriensEAMApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConnectionNotifier(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
      ],
      connectionNotificationOptions: ConnectionNotificationOptions(
        height: 20,
        alignment: AlignmentDirectional.bottomCenter,
        disconnectedBackgroundColor: Colors.red.withOpacity(0.9),
        disconnectedContent: const Align(
          alignment: Alignment.center,
          child: Text(
            "No Connection",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        restorationScopeId: 'app',
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English, no country code
        ],
        onGenerateTitle: (BuildContext context) =>
            AppLocalizations.of(context)!.appTitle,
        theme: ThemeData(
          primaryColor: Colors.blue,
          fontFamily: "Aeonik",
          tabBarTheme: const TabBarTheme(
              labelColor: Colors.blue, unselectedLabelColor: Colors.black),
        ),
        darkTheme: ThemeData.dark(),
        routerConfig: goRouter,
      ),
    );
  }
}
