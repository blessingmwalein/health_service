// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_group_chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserGroupChatResponseModel _$UserGroupChatResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserGroupChatResponseModel(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>)
          .map((e) => GroupChat.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$UserGroupChatResponseModelToJson(
        UserGroupChatResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };

JoinGroupChatResponseModel _$JoinGroupChatResponseModelFromJson(
        Map<String, dynamic> json) =>
    JoinGroupChatResponseModel(
      success: json['success'] as bool?,
      data: GroupChatUser.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$JoinGroupChatResponseModelToJson(
        JoinGroupChatResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
