// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_users_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllUsersEntity _$AllUsersEntityFromJson(Map<String, dynamic> json) =>
    AllUsersEntity(
      createdAt: json['CreatedAt'] as String?,
      updatedAt: json['UpdatedAt'] as String?,
      deletedAt: json['DeletedAt'] as String?,
      iD: (json['ID'] as num?)?.toInt(),
      username: json['Username'] as String?,
      email: json['Email'] as String?,
      password: json['Password'] as String?,
    );

Map<String, dynamic> _$AllUsersEntityToJson(AllUsersEntity instance) =>
    <String, dynamic>{
      'CreatedAt': instance.createdAt,
      'UpdatedAt': instance.updatedAt,
      'DeletedAt': instance.deletedAt,
      'ID': instance.iD,
      'Username': instance.username,
      'Email': instance.email,
      'Password': instance.password,
    };
