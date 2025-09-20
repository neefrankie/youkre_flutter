// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toc_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TocEntry _$TocEntryFromJson(Map<String, dynamic> json) => TocEntry(
  id: json['hex_id'] as String,
  slug: json['slug'] as String,
  title: json['title'] as String,
  summary: json['summary'] as String,
  keywords: json['keywords'] as String,
  children: (json['children'] as List<dynamic>?)
      ?.map((e) => TocEntry.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TocEntryToJson(TocEntry instance) => <String, dynamic>{
  'hex_id': instance.id,
  'slug': instance.slug,
  'title': instance.title,
  'summary': instance.summary,
  'keywords': instance.keywords,
  'children': instance.children,
};
