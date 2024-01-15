// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoResponseModel _$InfoResponseModelFromJson(Map<String, dynamic> json) =>
    InfoResponseModel(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>)
          .map((e) => Info.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$InfoResponseModelToJson(InfoResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
