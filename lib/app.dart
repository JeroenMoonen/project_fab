import 'package:flutter/material.dart';
import 'package:project_fab/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      navigatorObservers: const [
        // FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)
      ],
      // title: '',
    );
  }
}
