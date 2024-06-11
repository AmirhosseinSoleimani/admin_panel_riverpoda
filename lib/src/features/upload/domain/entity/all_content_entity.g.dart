// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_content_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllContentEntity _$AllContentEntityFromJson(Map<String, dynamic> json) =>
    AllContentEntity(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      categoryId: (json['category_id'] as num?)?.toInt(),
      authorId: (json['author_id'] as num?)?.toInt(),
      authorName: json['author_name'] as String?,
      createdAt: json['CreatedAt'] as String?,
      imageUrl: json['image_url'] as String?,
      viewCount: (json['view_count'] as num?)?.toInt(),
      duration: json['duration'] as String?,
      isLive: json['is_live'] as bool?,
    );

Map<String, dynamic> _$AllContentEntityToJson(AllContentEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'category_id': instance.categoryId,
      'author_id': instance.authorId,
      'author_name': instance.authorName,
      'CreatedAt': instance.createdAt,
      'image_url': instance.imageUrl,
      'view_count': instance.viewCount,
      'duration': instance.duration,
      'is_live': instance.isLive,
    };
