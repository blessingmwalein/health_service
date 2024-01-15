// To parse this JSON data, do
//
//     final userGroupChatResponseModel = userGroupChatResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:health_service/models/auth_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_group_chat_model.g.dart';

UserGroupChatResponseModel userGroupChatResponseModelFromJson(String str) =>
    UserGroupChatResponseModel.fromJson(json.decode(str));

String userGroupChatResponseModelToJson(UserGroupChatResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class UserGroupChatResponseModel {
  bool? success;
  List<GroupChat> data;
  String? message;

  UserGroupChatResponseModel({
    this.success,
    required this.data,
    this.message,
  });

  factory UserGroupChatResponseModel.fromJson(Map<String, dynamic> json) =>
      UserGroupChatResponseModel(
        success: json["success"],
        data: List<GroupChat>.from(
            json["data"].map((x) => GroupChat.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class GroupChat {
  int? id;
  String? name;
  String? icon;
  dynamic userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<GroupUser>? users;

  GroupChat({
    this.id,
    this.name,
    this.icon,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.users,
  });

  factory GroupChat.fromJson(Map<String, dynamic> json) => GroupChat(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        users: List<GroupUser>.from(
            json["users"].map((x) => GroupUser.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "user_id": userId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "users": List<dynamic>.from(users!.map((x) => x.toJson())),
      };
}

class GroupUser {
  int? id;
  int? groupChatId;
  int? userId;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  User user;

  GroupUser({
    this.id,
    this.groupChatId,
    this.userId,
    this.status,
    this.createdAt,
    this.updatedAt,
    required this.user,
  });

  factory GroupUser.fromJson(Map<String, dynamic> json) => GroupUser(
        id: json["id"],
        groupChatId: json["group_chat_id"],
        userId: json["user_id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "group_chat_id": groupChatId,
        "user_id": userId,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "user": user.toJson(),
      };
}

JoinGroupChatResponseModel joinGroupChatResponseModelFromJson(String str) =>
    JoinGroupChatResponseModel.fromJson(json.decode(str));

String joinGroupChatResponseModelToJson(JoinGroupChatResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class JoinGroupChatResponseModel {
  bool? success;
  GroupChatUser data;
  String? message;

  JoinGroupChatResponseModel({
    this.success,
    required this.data,
    this.message,
  });

  factory JoinGroupChatResponseModel.fromJson(Map<String, dynamic> json) =>
      JoinGroupChatResponseModel(
        success: json["success"],
        data: GroupChatUser.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
      };
}

class GroupChatUser {
  int? groupChatId;
  int? userId;
  String? status;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  GroupChatUser({
    this.groupChatId,
    this.userId,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory GroupChatUser.fromJson(Map<String, dynamic> json) => GroupChatUser(
        groupChatId: json["group_chat_id"],
        userId: json["user_id"],
        status: json["status"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "group_chat_id": groupChatId,
        "user_id": userId,
        "status": status,
        "updated_at": updatedAt!.toIso8601String(),
        "created_at": createdAt!.toIso8601String(),
        "id": id,
      };
}


