// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'name': instance.name,
      'avatar': instance.avatar,
      'username': instance.username,
      'password': instance.password,
    };
