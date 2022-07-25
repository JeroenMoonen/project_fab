import 'package:flutter/material.dart';
import 'package:project_fab/pages/home_page.dart';
import 'package:project_fab/pages/onboarding/login_page.dart';
import 'package:project_fab/services/authentication_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: AuthenticationService.isLoggedIn() == true
          ? const HomePage()
          : const LoginPage(),
      debugShowCheckedModeBanner: false,
      navigatorObservers: const [
        // FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)
      ],
      // title: '',
    );
  }
}
