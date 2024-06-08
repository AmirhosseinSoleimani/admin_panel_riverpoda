import 'package:json_annotation/json_annotation.dart';

part 'all_users_entity.g.dart';

@JsonSerializable()
class AllUsersEntity {
  @JsonKey(name: 'CreatedAt')
  String? createdAt;
  @JsonKey(name: 'UpdatedAt')
  String? updatedAt;
  @JsonKey(name: 'DeletedAt')
  String? deletedAt;
  @JsonKey(name: 'ID')
  int? iD;
  @JsonKey(name: 'Username')
  String? username;
  @JsonKey(name: 'Email')
  String? email;
  @JsonKey(name: 'Password')
  String? password;

  AllUsersEntity({this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.iD,
    this.username,
    this.email,
    this.password});

  factory AllUsersEntity.fromJson(Map<String, dynamic> json) => _$AllUsersEntityFromJson(json);

}