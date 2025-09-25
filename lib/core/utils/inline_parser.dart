abstract class InlineElement {
  const InlineElement();
}

class TextElement extends InlineElement {
  final String text;
  const TextElement(this.text);
}

class BoldElement extends InlineElement {
  final String text;
  const BoldElement(this.text);
}

class ItalicElement extends InlineElement {
  final String text;
  const ItalicElement(this.text);
}

class InlineMathElement extends InlineElement {
  final String formula;
  InlineMathElement(this.formula);
}

class InlineParser {
  static List<InlineElement> parse(String text) {
    final List<InlineElement> result = [];
    int i = 0;

    while (i < text.length) {
      // 处理 **加粗**
      if (i + 1 < text.length && text[i] == '*' && text[i + 1] == '*') {
        final start = i;
        // 跳过 **
        i += 2;
        final end = _findUnescaped(text, '**', i);
        if (end != -1) {
          final content = text.substring(i, end);
          result.add(BoldElement(content));
          i = end + 2;
        } else {
          // 没找到结束 **，当作普通文本
          i = start;
          int j = i;
          while (j < text.length && !(text[j] == '*' && j + 1 < text.length && text[j + 1] == '*')) {
            if (text[j] == r'\' && j + 1 < text.length) {
              j += 2;
            } else {
              j++;
            }
          }
          result.add(TextElement(text.substring(i, j)));
          i = j;
        }
        continue;
      }

      // 处理 *斜体*
      if (text[i] == '*' && (i == 0 || text[i - 1] != '*') && (i + 1 < text.length && text[i + 1] != '*')) {
        final start = i;
        i += 1;
        final end = _findUnescaped(text, '*', i);
        if (end != -1) {
          final content = text.substring(i, end);
          result.add(ItalicElement(content));
          i = end + 1;
        } else {
          // 没找到结束 *，当作普通文本
          i = start;
          int j = i;
          while (j < text.length) {
            if (text[j] == r'\' && j + 1 < text.length) {
              j += 2;
            } else if (text[j] == '*' && (j == 0 || text[j - 1] != '*') && (j + 1 < text.length && text[j + 1] != '*')) {
              break; // 单个 *，可能是斜体开始
            } else {
              j++;
            }
          }
          result.add(TextElement(text.substring(i, j)));
          i = j;
        }
        continue;
      }

      // 处理 $LaTeX$
      if (text[i] == r'$') {
        final start = i;
        i += 1;
        final end = _findUnescaped(text, r'$', i);
        if (end != -1) {
          final formula = text.substring(i, end);
          result.add(InlineMathElement(formula));
          i = end + 1;
        } else {
          // 没找到结束 $，当作普通文本
          result.add(TextElement(r'$'));
          i = start + 1;
        }
        continue;
      }

      // 普通文本
      int j = i;
      while (j < text.length) {
        if (text[j] == r'\' && j + 1 < text.length) {
          j += 2; // 跳过转义
        } else if (
          // 只有遇到可能的格式标记才中断
        (text[j] == '*' && j + 1 < text.length && text[j + 1] == '*') || // **
            (text[j] == '*' && (j == 0 || text[j - 1] != '*') && (j + 1 < text.length && text[j + 1] != '*')) || // 单个 *
            text[j] == r'$'
        ) {
          break;
        } else {
          j++;
        }
      }
      if ( j > i) {
        result.add(TextElement(text.substring(i, j)));
      }
      i = j;
    }

    return result;
  }

  static int _findUnescaped(String text, String marker, int start) {
    int i = start;
    final len = marker.length;
    while (i <= text.length - len) {
      if (text[i] == r'\' && i + 1 < text.length) {
        i += 2;
      } else if (marker.length == 1) {
        if (text[i] == marker) {
          return i;
        }
        i++;
      } else {
        if (text.substring(i, i + len) == marker) {
          return i;
        }
        i++;
      }
    }
    return -1;
  }
}
