import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

class UserAgentInterceptor extends Interceptor {
  @override
  Future<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var packageInfo = await PackageInfo.fromPlatform();
    options.headers['User-Agent'] =
        '${packageInfo.appName} - ${packageInfo.packageName}/${packageInfo.version}+${packageInfo.buildNumber} - Dart/${Platform.version} - OS: ${Platform.operatingSystem}/${Platform.operatingSystemVersion}';

    if (kDebugMode) {
      print("Use user-agent ${options.headers['User-Agent']}");
    }

    handler.next(options);
  }
}
