import 'package:flutter/material.dart';
import 'package:project_fab/pages/discover/discover_page.dart';
import 'package:project_fab/pages/home_page.dart';
import 'package:project_fab/pages/onboarding/forgot_password_page.dart';
import 'package:project_fab/pages/onboarding/login_page.dart';
import 'package:project_fab/pages/onboarding/register_page.dart';
import 'package:project_fab/pages/people/people_page.dart';
import 'package:project_fab/pages/profile/profile_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/feed',
      routes: {
        '/feed': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/forgot-password': (context) => const ForgotPasswordPage(),
        '/me': (context) => const ProfilePage(),
        '/people': (context) => const PeoplePage(),
        '/discover': (context) => const DiscoverPage(),
      },
      debugShowCheckedModeBanner: false,
      navigatorObservers: const [
        // FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)
      ],
      // title: '',
    );
  }
}
