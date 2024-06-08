// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddUsersEntity _$AddUsersEntityFromJson(Map<String, dynamic> json) =>
    AddUsersEntity(
      createdAt: json['CreatedAt'] as String?,
      updatedAt: json['UpdatedAt'] as String?,
      deletedAt: json['DeletedAt'] as String?,
      iD: (json['ID'] as num?)?.toInt(),
      username: json['Username'] as String?,
      email: json['Email'] as String?,
      password: json['Password'] as String?,
    );

Map<String, dynamic> _$AddUsersEntityToJson(AddUsersEntity instance) =>
    <String, dynamic>{
      'CreatedAt': instance.createdAt,
      'UpdatedAt': instance.updatedAt,
      'DeletedAt': instance.deletedAt,
      'ID': instance.iD,
      'Username': instance.username,
      'Email': instance.email,
      'Password': instance.password,
    };
