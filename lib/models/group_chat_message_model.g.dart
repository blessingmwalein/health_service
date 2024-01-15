// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupChatMessageResponseModel _$GroupChatMessageResponseModelFromJson(
        Map<String, dynamic> json) =>
    GroupChatMessageResponseModel(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>)
          .map((e) => GroupChatMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GroupChatMessageResponseModelToJson(
        GroupChatMessageResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };

SendGroupChatMessageResponseModel _$SendGroupChatMessageResponseModelFromJson(
        Map<String, dynamic> json) =>
    SendGroupChatMessageResponseModel(
      success: json['success'] as bool?,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SendGroupChatMessageResponseModelToJson(
        SendGroupChatMessageResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
