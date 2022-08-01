import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:project_fab/exceptions/dio_exception.dart';
import '../models/models.dart';
import '../utils/http/http_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static const meUserKey = 'meUserId';

  static void _saveUserToLocal(User user, bool isMe) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (isMe) {
      await prefs.setInt(meUserKey, user.id);
    }

    await prefs.setString('user_${user.id}', jsonEncode(user));
  }

  static Future<User?> _getUserFromLocal(int userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> userMap = {};
    final String? userStr = prefs.getString('user_$userId');
    if (userStr != null) {
      userMap = jsonDecode(userStr) as Map<String, dynamic>;
      return User.fromJson(userMap);
    }

    return null;
  }

  static Future<User> getMe() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int userId = prefs.getInt(meUserKey) as int;

    final User? user = await _getUserFromLocal(userId);

    if (user == null) {
      throw Exception('User not found.');
    }

    return user;
  }

  static Future<User> getUser({
    required int id,
    bool fromLocal = true,
    bool saveToLocal = false,
    bool isMe = false,
  }) async {
    try {
      final Response response =
          await HttpClient.create().get('${HttpClient.apiUrl}/users/$id');

      final User user = User.fromJson(response.data);

      if (saveToLocal) {
        _saveUserToLocal(user, isMe);
      }

      return user;
    } on DioError catch (error) {
      if (kDebugMode) {
        print("Error while logging in: ${error.message}.");
      }
      return Future.error(DioException.fromDioError(error));
    }
  }
}
