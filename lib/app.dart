import 'package:flutter/material.dart';
import 'package:project_fab/pages/checkin/checkin_detail.dart';
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
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        LoginPage.routeName: (context) => const LoginPage(),
        RegisterPage.routeName: (context) => const RegisterPage(),
        ForgotPasswordPage.routeName: (context) => const ForgotPasswordPage(),
        ProfilePage.routeName: (context) => const ProfilePage(),
        PeoplePage.routeName: (context) => const PeoplePage(),
        DiscoverPage.routeName: (context) => const DiscoverPage(),
        CheckinDetailPage.routeName: (context) => const CheckinDetailPage(),
      },
      debugShowCheckedModeBanner: false,
      navigatorObservers: const [
        // FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)
      ],
      // title: '',
    );
  }
}
