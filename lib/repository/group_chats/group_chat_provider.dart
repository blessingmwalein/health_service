import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:health_service/constants/urls.dart';
import 'package:health_service/helper/helper_methods.dart';

import 'package:http/http.dart' as http;

class GroupChatProvider {
  final FlutterSecureStorage storage;

  GroupChatProvider({required this.storage});

  //get loadsheets by status
  Future getUserGroupChats() async {
    try {
      var token = await storage.read(key: 'token');
      print('token $token');
      final response = await http.get(
        Uri.parse('${UrlStrings.prodBaseUrl}group-chats'),
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

  Future getUserNotGroupChats() async {
    try {
      var token = await storage.read(key: 'token');
      print('token $token');
      final response = await http.get(
        Uri.parse('${UrlStrings.prodBaseUrl}not-joined'),
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

  Future getGroupChatMessages(int groupChatId) async {
    try {
      var token = await storage.read(key: 'token');
      print('token $token');
      final response = await http.get(
        Uri.parse(
            '${UrlStrings.prodBaseUrl}group-chats/${groupChatId}/messages'),
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

  //send group chat message
  Future sendGroupChatMessage({
    required String message,
    required int groupChatId,
    File? file,
  }) async {
    try {
      var token = await storage.read(key: 'token');

      final request = http.MultipartRequest(
        'POST',
        Uri.parse(
            '${UrlStrings.prodBaseUrl}group-chats/$groupChatId/sendMessage'),
      );

      // Add text fields to the request
      request.fields['message'] = message;
      request.fields['group_chat_id'] = groupChatId.toString();

      // Add file to the request, if any
      if (file != null) {
        var stream = http.ByteStream(file.openRead());
        var length = await file.length();
        var multipartFile = http.MultipartFile('file', stream, length,
            filename: file.path.split('/').last);
        request.files.add(multipartFile);
      }

      // Set headers
      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      final response = await request.send();

      // Check the response status
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        return responseBody;
      } else {
        var data = jsonDecode(response.toString());
        data['message'] != null
            ? throw Exception(data['message'])
            : throw Exception(data['errors'].toString());
      }
    } catch (exception) {
      throw Exception(exception.toString());
    }
  }

  Future joinGroup(int groupChatId) async {
    try {
      var token = await storage.read(key: 'token');

      final response = await http.post(
        Uri.parse('${UrlStrings.prodBaseUrl}chat/join-group/$groupChatId'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: Helper.encodeData({}),
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
