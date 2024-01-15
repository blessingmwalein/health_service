// To parse this JSON data, do
//
//     final serviceResponseModel = serviceResponseModelFromJson(jsonString);

import 'dart:convert';

ServiceResponseModel serviceResponseModelFromJson(String str) =>
    ServiceResponseModel.fromJson(json.decode(str));

String serviceResponseModelToJson(ServiceResponseModel data) =>
    json.encode(data.toJson());

class ServiceResponseModel {
  bool? success;
  List<Service> data;
  String? message;

  ServiceResponseModel({
    this.success,
    required this.data,
    this.message,
  });

  factory ServiceResponseModel.fromJson(Map<String, dynamic> json) =>
      ServiceResponseModel(
        success: json["success"],
        data: List<Service>.from(json["data"].map((x) => Service.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Service {
  int? id;
  String? title;
  String? icon;
  String? description;
  String? phoneNumber;
  String? email;
  String? workingHours;
  String? address;
  String? city;
  dynamic latitude;
  dynamic longitude;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<HealthService>? services;

  Service({
    this.id,
    this.title,
    this.icon,
    this.description,
    this.phoneNumber,
    this.email,
    this.workingHours,
    this.address,
    this.city,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.updatedAt,
    this.services,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        title: json["title"],
        icon: json["icon"],
        description: json["description"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        workingHours: json["working_hours"],
        address: json["address"],
        city: json["city"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        services: List<HealthService>.from(
            json["services"].map((x) => HealthService.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "icon": icon,
        "description": description,
        "phone_number": phoneNumber,
        "email": email,
        "working_hours": workingHours,
        "address": address,
        "city": city,
        "latitude": latitude,
        "longitude": longitude,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "services": List<dynamic>.from(services!.map((x) => x.toJson())),
      };
}

class HealthService {
  int? id;
  int? healthServiceId;
  String? description;
  String? title;
  String? icon;
  dynamic cost;
  DateTime? createdAt;
  DateTime? updatedAt;

  HealthService({
    this.id,
    this.healthServiceId,
    this.description,
    this.title,
    this.icon,
    this.cost,
    this.createdAt,
    this.updatedAt,
  });

  factory HealthService.fromJson(Map<String, dynamic> json) => HealthService(
        id: json["id"],
        healthServiceId: json["health_service_id"],
        description: json["description"],
        title: json["title"],
        icon: json["icon"],
        cost: json["cost"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "health_service_id": healthServiceId,
        "description": description,
        "title": title,
        "icon": icon,
        "cost": cost,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
