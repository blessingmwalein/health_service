// To parse this JSON data, do
//
//     final groupChatMessageResponseModel = groupChatMessageResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:health_service/models/auth_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group_chat_message_model.g.dart';

GroupChatMessageResponseModel groupChatMessageResponseModelFromJson(
        String str) =>
    GroupChatMessageResponseModel.fromJson(json.decode(str));

String groupChatMessageResponseModelToJson(
        GroupChatMessageResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class GroupChatMessageResponseModel {
  bool? success;
  List<GroupChatMessage> data;
  String? message;

  GroupChatMessageResponseModel({
    this.success,
    required this.data,
    this.message,
  });

  factory GroupChatMessageResponseModel.fromJson(Map<String, dynamic> json) =>
      GroupChatMessageResponseModel(
        success: json["success"],
        data: List<GroupChatMessage>.from(
            json["data"].map((x) => GroupChatMessage.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class GroupChatMessage {
  int? id;
  String? message;
  int? groupChatId;
  int? senderId;
  String? file;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? sender;
  dynamic isMe;

  GroupChatMessage({
    this.id,
    this.message,
    this.groupChatId,
    this.senderId,
    this.file,
    this.createdAt,
    this.updatedAt,
    this.sender,
    this.isMe,
  });

  factory GroupChatMessage.fromJson(Map<String, dynamic> json) =>
      GroupChatMessage(
        id: json["id"],
        message: json["message"],
        groupChatId: json["group_chat_id"],
        senderId: json["sender_id"],
        file: json["file"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        sender: User.fromJson(json["sender"]),
        isMe: json['is_mine'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
        "group_chat_id": groupChatId,
        "sender_id": senderId,
        "file": file,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "sender": sender?.toJson(),
        "is_mine": isMe,
      };
}

SendGroupChatMessageResponseModel sendGroupChatMessageResponseModelFromJson(
        String str) =>
    SendGroupChatMessageResponseModel.fromJson(json.decode(str));

String sendGroupChatMessageResponseModelToJson(
        SendGroupChatMessageResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class SendGroupChatMessageResponseModel {
  bool? success;
  Data data;
  String? message;

  SendGroupChatMessageResponseModel({
    this.success,
    required this.data,
    this.message,
  });

  factory SendGroupChatMessageResponseModel.fromJson(
          Map<String, dynamic> json) =>
      SendGroupChatMessageResponseModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  String? groupChatId;
  String? message;
  int? senderId;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;
  String? file;
  bool? isMine;

  Data({
    this.groupChatId,
    this.message,
    this.senderId,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.file,
    this.isMine,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        groupChatId: json["group_chat_id"],
        message: json["message"],
        senderId: json["sender_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        file: json["file"],
        isMine: json["is_mine"],
      );

  Map<String, dynamic> toJson() => {
        "group_chat_id": groupChatId,
        "message": message,
        "sender_id": senderId,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
        "file": file,
        "is_mine": isMine,
      };
}
