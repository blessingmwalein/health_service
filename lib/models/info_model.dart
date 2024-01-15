// To parse this JSON data, do
//
//     final infoResponseModel = infoResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'info_model.g.dart';

InfoResponseModel infoResponseModelFromJson(String str) =>
    InfoResponseModel.fromJson(json.decode(str));

String infoResponseModelToJson(InfoResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class InfoResponseModel {
  bool? success;
  List<Info> data;
  String? message;

  InfoResponseModel({
    this.success,
    required this.data,
    this.message,
  });

  factory InfoResponseModel.fromJson(Map<String, dynamic> json) =>
      InfoResponseModel(
        success: json["success"],
        data: List<Info>.from(json["data"].map((x) => Info.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Info {
  int? id;
  String? title;
  String? icon;
  String? description;
  int? topicId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Info({
    this.id,
    this.title,
    this.icon,
    this.description,
    this.topicId,
    this.createdAt,
    this.updatedAt,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        id: json["id"],
        title: json["title"],
        icon: json["icon"],
        description: json["description"],
        topicId: json["topic_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "icon": icon,
        "description": description,
        "topic_id": topicId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
