// class CourseKind {
//   final String value;
//   final String title;
//
//   const CourseKind._(this.value, this.title);
//
//   static const all = CourseKind._('all', '所有');
//   static const calculus = CourseKind._('calculus', '微积分');
//   static const algebra = CourseKind._('algebra', '代数');
//   static const probability = CourseKind._('probability', '概率');
//   static const trigonometry = CourseKind._('trigonometry', '三角函数');
//
//   static const List<CourseKind> values = [
//     all,
//     calculus,
//     algebra,
//     probability,
//     trigonometry,
//   ];
//
//   // Identifiable: id 就是 value
//   String get id => value;
//
//   // Codable 支持：转 JSON
//   String toJson() => value;
//
//   // 从字符串创建（对应 init(from: Decoder)）
//   static CourseKind? fromJson(String? json) {
//     if (json == null) return null;
//     return values.firstWhere((kind) => kind.value == json, orElse: () => all);
//   }
//
//   // 可选：支持 switch-case 风格的 map 操作
//   // 类似 switch 的操作
//   // final icon = kind.when(
//   //   all: () => Icons.category,
//   //   calculus: () => Icons.calculate,
//   //   algebra: () => Icons.functions,
//   //   probability: () => Icons.timeline,
//   //   trigonometry: () => Icons.rotate_right,
//   // );
//   T when<T>({
//     required T Function() all,
//     required T Function() calculus,
//     required T Function() algebra,
//     required T Function() probability,
//     required T Function() trigonometry,
//   }) {
//     return switch (value) {
//       'all' => all(),
//       'calculus' => calculus(),
//       'algebra' => algebra(),
//       'probability' => probability(),
//       'trigonometry' => trigonometry(),
//       _ => all(),
//     };
//   }
//
//   // 重写 == 和 hashCode，便于比较
//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
//     if (other.runtimeType != runtimeType) return false;
//     return other is CourseKind && other.value == value;
//   }
//
//   @override
//   int get hashCode => value.hashCode;
//
//   @override
//   String toString() => 'CourseKind($value, $title)';
// }

enum CourseKind {
  all(displayName: '所有'),
  calculus(displayName: '微积分'),
  algebra(displayName: '代数'),
  probability(displayName: '概率统计'),
  trigonometry(displayName: '三角函数');

  const CourseKind({
    required this.displayName,
  });

  final String displayName;
}