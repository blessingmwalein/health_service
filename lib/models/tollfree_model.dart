// To parse this JSON data, do
//
//     final tollFreeResponseModel = tollFreeResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'tollfree_model.g.dart';

TollFreeResponseModel tollFreeResponseModelFromJson(String str) =>
    TollFreeResponseModel.fromJson(json.decode(str));

String tollFreeResponseModelToJson(TollFreeResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class TollFreeResponseModel {
  bool? success;
  List<TollFree> data;
  String? message;

  TollFreeResponseModel({
    this.success,
    required this.data,
    this.message,
  });

  factory TollFreeResponseModel.fromJson(Map<String, dynamic> json) =>
      TollFreeResponseModel(
        success: json["success"],
        data:
            List<TollFree>.from(json["data"].map((x) => TollFree.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class TollFree {
  int? id;
  String? title;
  String? icon;
  String? description;
  String? phoneNumber;
  String? email;
  String? workingHours;
  int? isVerified;
  DateTime? createdAt;
  DateTime? updatedAt;

  TollFree({
    this.id,
    this.title,
    this.icon,
    this.description,
    this.phoneNumber,
    this.email,
    this.workingHours,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
  });

  factory TollFree.fromJson(Map<String, dynamic> json) => TollFree(
        id: json["id"],
        title: json["title"],
        icon: json["icon"],
        description: json["description"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        workingHours: json["working_hours"],
        isVerified: json["is_verified"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "icon": icon,
        "description": description,
        "phone_number": phoneNumber,
        "email": email,
        "working_hours": workingHours,
        "is_verified": isVerified,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
