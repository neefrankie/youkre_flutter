import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'toc_entry.g.dart';

@JsonSerializable()
class TocEntry extends Equatable {
  @JsonKey(name: 'hex_id')
  final String id;
  final String slug;
  final String title;
  final String summary;
  final String keywords;
  final List<TocEntry>? children;

  const TocEntry({
    required this.id,
    required this.slug,
    required this.title,
    required this.summary,
    required this.keywords,
    this.children,
  });

  factory TocEntry.fromJson(Map<String, dynamic> json) => _$TocEntryFromJson(json);

   Map<String, dynamic> toJson() => _$TocEntryToJson(this);

   @override
  List<Object?> get props => [id];

   @override
  String toString() {
    return 'TocEntry(id: $id, slug: $slug, title: $title, summary: $summary)';
  }

  TocDisplayEntry toDisplayEntry({int level = 0}) {
     return TocDisplayEntry(
       id: id,
       slug: slug,
       title: title,
       summary: summary,
       keywords: keywords,
       level: level
     );
  }
}

class TocDisplayEntry {
  final String id;
  final String slug;
  final String title;
  final String summary;
  final String keywords;
  final int level;

  TocDisplayEntry({
    required this.id,
    required this.slug,
    required this.title,
    required this.summary,
    required this.keywords,
    required this.level,
  });
}

List<TocDisplayEntry> flattenToc(List<TocEntry> entries, {int level = 0}) {
  List<TocDisplayEntry> result = [];

  for (var entry in entries) {
    result.add(entry.toDisplayEntry(level: level));
    if (entry.children != null) {
      result.addAll(flattenToc(entry.children!, level: level+1));
    }
  }
  return result;
}