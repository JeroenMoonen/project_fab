import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:project_fab/exceptions/dio_exception.dart';
import '../models/models.dart';
import '../utils/http/http_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static void _saveUserToLocal(data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('id', data.id);
    await prefs.setString('firstName', data.firstName.toString());
    await prefs.setString('lastName', data.lastName.toString());
    await prefs.setString('email', data.email.toString());
    await prefs.setString('dateOfBirth', data.dateOfBirth.toString());
    await prefs.setString('about', data.about.toString());
    await prefs.setString('location', data.location.toString());
    await prefs.setInt('checkinCount', data.checkinCount);
    await prefs.setInt('friendsCount', data.friendsCount);
  }

  static Future<void> destroyData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static Future<User> getMe() async {
    final prefs = await SharedPreferences.getInstance();
    return User.fromJson(
      {
        'id': prefs.getInt('id'),
        'firstName': prefs.getString('firstName'),
        'lastName': prefs.getString('lastName'),
        'email': prefs.getString('email'),
        'dateOfBirth': prefs.getString('dateOfBirth'),
        'about': prefs.getString('about'),
        'location': prefs.getString('location'),
        'checkinCount': prefs.getInt('checkinCount'),
        'friendsCount': prefs.getInt('friendsCount'),
      },
    );
  }

  static Future<User> getUser({
    required int id,
    bool saveToLocal = false,
  }) async {
    try {
      var response =
          await HttpClient.create().get('${HttpClient.apiUrl}/users/$id');

      var data = User.fromJson(response.data);

      if (saveToLocal) {
        _saveUserToLocal(data);
      }
      return data;
    } on DioError catch (error) {
      if (kDebugMode) {
        print("Error while logging in: ${error.message}.");
      }
      return Future.error(DioException.fromDioError(error));
    }
  }
}
