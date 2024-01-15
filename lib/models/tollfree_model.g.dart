// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tollfree_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TollFreeResponseModel _$TollFreeResponseModelFromJson(
        Map<String, dynamic> json) =>
    TollFreeResponseModel(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>)
          .map((e) => TollFree.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$TollFreeResponseModelToJson(
        TollFreeResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
