import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:health_service/constants/configs.dart';
import 'package:health_service/constants/urls.dart';
import 'package:health_service/helper/helper_methods.dart';
import 'package:http/http.dart' as http;

class AuthenticationProvider {
  final FlutterSecureStorage storage;
  AuthenticationProvider({
    required this.storage,
  });

  Future login({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };
    try {
      final response = await http.post(
        Uri.parse('${UrlStrings.prodBaseUrl}user/login'),
        headers: Config.httpHeaders,
        body: Helper.encodeData(data),
      );
      if (response.statusCode == 200) {
        // print(response.body.toString());
        return response.body;
      } else {
        var data = jsonDecode(response.body);
        data['message'] != null
            ? throw Exception(data['message'])
            : throw Exception(data['errors'].toString());
      }
    } catch (exception) {
      throw Exception(exception.toString());
    }
  }

  Future register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    Map<String, dynamic> data = {
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'first_name': firstName,
      'last_name': lastName,
    };
    try {
      final response = await http.post(
        Uri.parse('${UrlStrings.prodBaseUrl}user/register'),
        headers: Config.httpHeaders,
        body: Helper.encodeData(data),
      );
      if (response.statusCode == 200) {
        // print(response.body.toString());
        return response.body;
      } else {
        var data = jsonDecode(response.body);
        data['message'] != null
            ? throw Exception(data['message'])
            : throw Exception(data['errors'].toString());
      }
    } catch (exception) {
      throw Exception(exception.toString());
    }
  }

  //update profile
  Future updateProfile({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String gender,
    required String address,
    required String city,
  }) async {
    Map<String, dynamic> data = {
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'gender': gender,
      'address': address,
      'city': city,
    };

    try {
      var token = await storage.read(key: 'token');

      final response = await http.post(
        Uri.parse('${UrlStrings.prodBaseUrl}user/update'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: Helper.encodeData(data),
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        var data = jsonDecode(response.body);
        data['message'] != null
            ? throw Exception(data['message'])
            : throw Exception(data['errors'].toString());
      }
    } catch (exception) {
      throw Exception(exception.toString());
    }
  }

  //change password
  Future changePassword({
    required String oldPassword,
    required String password,
    required String passwordConfirmation,
  }) async {
    Map<String, dynamic> data = {
      'current_password': oldPassword,
      'new_password': password,
      'new_password_confirmation': passwordConfirmation,
    };
    try {
      var token = await storage.read(key: 'token');

      final response = await http.post(
        Uri.parse('${UrlStrings.prodBaseUrl}user/change-password'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: Helper.encodeData(data),
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        var data = jsonDecode(response.body);
        data['message'] != null
            ? throw Exception(data['message'])
            : throw Exception(data['errors'].toString());
      }
    } catch (exception) {
      throw Exception(exception.toString());
    }
  }

  //get auth token
  Future getAuthToken() async {
    var token = await storage.read(key: 'token');
    return token;
  }

  //get cache user
  Future getCacheUser() async {
    var profile = await storage.read(key: 'user');
    return profile;
  }

  //logout
  Future logOut() async {
    await storage.deleteAll();
    //remove token from storage
    return true;
  }
}
