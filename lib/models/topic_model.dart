// To parse this JSON data, do
//
//     final topicResponseModel = topicResponseModelFromJson(jsonString);

import 'dart:convert';
import 'package:health_service/models/service_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'topic_model.g.dart';

TopicResponseModel topicResponseModelFromJson(String str) =>
    TopicResponseModel.fromJson(json.decode(str));

String topicResponseModelToJson(TopicResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class TopicResponseModel {
  bool? success;
  List<Topic> data;
  String? message;

  TopicResponseModel({
    this.success,
    required this.data,
    this.message,
  });

  factory TopicResponseModel.fromJson(Map<String, dynamic> json) =>
      TopicResponseModel(
        success: json["success"],
        data: List<Topic>.from(json["data"].map((x) => Topic.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class Topic {
  int? id;
  String? title;
  String? icon;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Sti>? stis;

  Topic({
    this.id,
    this.title,
    this.icon,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.stis,
  });

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        id: json["id"],
        title: json["title"],
        icon: json["icon"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        stis: (json["stis"] as List<dynamic>?)
                ?.map((x) => Sti.fromJson(x))
                ?.toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "icon": icon,
        "description": description,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "stis": stis?.map((x) => x.toJson()).toList() ?? [],
      };
}

class Sti {
  int? id;
  String? name;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? topicId;
  String? description;
  List<SympTom>? sympToms;
  List<Center>? centers;
  String? treatment;
  String? diagnostics;

  Sti({
    this.id,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.topicId,
    this.description,
    this.sympToms,
    this.centers,
    this.treatment,
    this.diagnostics
  });

  factory Sti.fromJson(Map<String, dynamic> json) => Sti(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        topicId: json["topic_id"],
        description: json["description"],
        treatment: json["treatment"],
        diagnostics: json["diagnostics"],
        sympToms: List<SympTom>.from(
            json["symp_toms"].map((x) => SympTom.fromJson(x))),
        centers:
            List<Center>.from(json["centers"].map((x) => Center.fromJson(x))),
        
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "topic_id": topicId,
        "description": description,
        "treatment": treatment,
        "diagnostics": diagnostics,
        "symp_toms": sympToms?.map((x) => x.toJson()).toList() ?? [],
        "centers": centers?.map((x) => x.toJson()).toList() ?? [],
      };
}

class Center {
  int? id;
  int? serviceId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? topicStiId;
  Service? healthService;

  Center({
    this.id,
    this.serviceId,
    this.createdAt,
    this.updatedAt,
    this.topicStiId,
    this.healthService,
  });

  factory Center.fromJson(Map<String, dynamic> json) => Center(
        id: json["id"],
        serviceId: json["service_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        topicStiId: json["topic_sti_id"],
        healthService: Service.fromJson(json["health_service"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "service_id": serviceId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "topic_sti_id": topicStiId,
        "health_service": healthService?.toJson(),
      };
}

class SympTom {
  int? id;
  int? topicStiId;
  String? description;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  SympTom({
    this.id,
    this.topicStiId,
    this.description,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory SympTom.fromJson(Map<String, dynamic> json) => SympTom(
        id: json["id"],
        topicStiId: json["topic_sti_id"],
        description: json["description"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "topic_sti_id": topicStiId,
        "description": description,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
