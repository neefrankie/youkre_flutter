// models/icon_symbol.dart

// 密封类：表示图标可以是 SF Symbol、LaTeX 或纯文本
sealed class IconSymbol {}

// 具体实现：SF Symbol
final class SFSymbol extends IconSymbol {
  final String name;
  SFSymbol(this.name);
}

// 具体实现：LaTeX
final class LatexIcon extends IconSymbol {
  final String latex;
  LatexIcon(this.latex);
}

// 具体实现：纯文本
final class TextIcon extends IconSymbol {
  final String text;
  TextIcon(this.text);
}