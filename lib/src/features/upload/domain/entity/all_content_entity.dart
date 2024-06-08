import 'package:json_annotation/json_annotation.dart';

part 'all_content_entity.g.dart';

@JsonSerializable()
class AllContentEntity {
  int? id;
  String? title;
  String? description;
  String? url;
  @JsonKey(name: 'category_id')
  int? categoryId;
  @JsonKey(name: 'author_id')
  int? authorId;
  @JsonKey(name: 'author_name')
  String? authorName;
  @JsonKey(name: 'CreatedAt')
  String? createdAt;

  AllContentEntity(
      {this.id,
        this.title,
        this.description,
        this.url,
        this.categoryId,
        this.authorId,
        this.authorName,
        this.createdAt});

  factory AllContentEntity.fromJson(Map<String, dynamic> json) => _$AllContentEntityFromJson(json);

}