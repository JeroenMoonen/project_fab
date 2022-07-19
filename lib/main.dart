import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:project_fab/app.dart';
import 'app.dart';

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      // await Firebase.initializeApp();
      if (kDebugMode) {
        // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
        // await FirebasePerformance.instance.setPerformanceCollectionEnabled(false);
      }
      await dotenv.load(
        fileName: kDebugMode ? 'environments/dev.env' : 'environments/.env',
      );
      // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

      ErrorWidget.builder = (FlutterErrorDetails error) {
        Zone.current.handleUncaughtError(error.exception, error.stack!);
        return ErrorWidget(error.exception);
      };

      runApp(const MyApp());
    },
    (exception, stackTrace) {
      if (kDebugMode) {
        print(exception.toString());
      }
    },
  );
  // FirebaseCrashlytics.instance.recordError(exception, stackTrace));
}
