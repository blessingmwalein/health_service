import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:health_service/constants/urls.dart';

import 'package:http/http.dart' as http;

class TopicProvider {
  final FlutterSecureStorage storage;

  TopicProvider({required this.storage});

  //get loadsheets by status
  Future getTopics() async {
    try {
      var token = await storage.read(key: 'token');
      print('token $token');
      final response = await http.get(
        Uri.parse('${UrlStrings.prodBaseUrl}topics'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
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
}
