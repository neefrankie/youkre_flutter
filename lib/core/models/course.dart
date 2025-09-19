import 'package:path/path.dart' as path;
import 'icon_symbol.dart';

class Course {
  final String id;
  final String slug;
  final String title;
  final String? summary;
  final String? keywords;
  final IconSymbol? icons;
  final String exerciseCover;
  final int contentVersion;

  Course({
    required this.id,
    required this.slug,
    required this.title,
    this.summary,
    this.keywords,
    this.icons,
    required this.exerciseCover,
    this.contentVersion = 1,
  });

  String exerciseCoverPath() {
    return 'assets/images/cover/${path.basenameWithoutExtension(exerciseCover)}.svg';
  }

  // Hashable: hash(into:) → 在 Dart 中通常用 == + hashCode 体现
  // 这里我们按 slug 哈希（Swift 版本）
  @override
  int get hashCode => slug.hashCode;

  // Identifiable: 基于 id 判断相等
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is Course && other.id == id;
  }

  // 可选：调试输出
  @override
  String toString() {
    return 'Course(id: $id, slug: $slug, title: $title)';
  }
}