class ChapterLink {
  final String courseSlug;
  final String chapterSlug;

  ChapterLink({
    required this.courseSlug,
    required this.chapterSlug,
  });

  // 手动实现 == (基于所有字段)
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is ChapterLink &&
        other.courseSlug == courseSlug &&
        other.chapterSlug == chapterSlug;
  }

  // 手动实现 hashCode
  @override
  int get hashCode => Object.hash(courseSlug, chapterSlug);
}