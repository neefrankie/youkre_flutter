import 'dart:core';
import 'dart:math' as math;
import 'package:path/path.dart' as path;

sealed class MarkdownBlock {}

class HeadingBlock extends MarkdownBlock {
  final int level;
  final String text;

  HeadingBlock(this.level, this.text);
}

class ParagraphBlock extends MarkdownBlock {
  final String text;
  ParagraphBlock(this.text);
}

class ListItemBlock extends MarkdownBlock {
  final List<String> items;

  ListItemBlock(this.items);
}

class MathBlock extends MarkdownBlock {
  final String latex;
  final bool multiLine;
  MathBlock( {
    required this.latex,
    this.multiLine = false,
  });
}

class ImageBlock extends MarkdownBlock {
  final String src;
  ImageBlock(this.src);
}

class TableBlock extends MarkdownBlock {
  final List<List<String>> cells;

  TableBlock(this.cells);
}

abstract class InlineElement {}

class InlineText extends InlineElement {
  final String text;
  InlineText(this.text);
}

class InlineMath extends InlineElement {
  final String latex;
  InlineMath(this.latex);
}

class MarkdownParser {
  static final Map<String, String> pathMapping = {
    '/images/exercise': 'assets/images/exercise',
    '/images/cover': 'assets/images/cover',
  };

  static List<MarkdownBlock> parse(String input) {
    final lines = input.split("\n\n");
    final blocks = <MarkdownBlock>[];

    for (var line in lines) {
      final trimmed = line.trim();

      if (trimmed.isEmpty) continue;

      if (trimmed.startsWith('#')) {
        blocks.add(parseHeading(trimmed));
      } else if (_isSquareLatex(trimmed)) {
        blocks.add(parseSquareLatex(trimmed));
      } else if (_isDollarLatex(trimmed)) {
        blocks.add(parseDollarLatex(trimmed));
      } else if (_isAlignLatex(trimmed)) {
        blocks.add(parseMultiLineLatex(trimmed));
      } else if (trimmed.startsWith('- ') || trimmed.startsWith('* ')) {
        blocks.add(parseList(trimmed));
      } else if (_isImage(trimmed)) {
        final img = parseImage(trimmed);
        if (img != null) {
          blocks.add(img);
        }
      } else if (trimmed.startsWith('|') && trimmed.endsWith('|')) {
        blocks.add(parseTable(trimmed));
      } else {
        blocks.add(ParagraphBlock(trimmed));
      }
    }

    return blocks;
  }

  static MarkdownBlock parseHeading(String line) {
    int level = 0;

    for (int i = 0; i < line.length; i++) {
      if (line[i] == '#') {
        level++;
      } else {
        break;
      }
    }

    level = math.min(level, 6);
    final text = line.substring(level).trim();
    return HeadingBlock(level, text);
  }

  static bool _isSquareLatex(String line) {
    return line.startsWith(r'\[') && line.endsWith(r'\]');
  }

  static MarkdownBlock parseSquareLatex(String line) {
    final content = line.substring(2, line.length - 2).trim();
    return MathBlock(latex: content);
  }

  static bool _isDollarLatex(String line) {
    return line.startsWith(r'$$') && line.endsWith(r'$$');
  }

  static MarkdownBlock parseDollarLatex(String line) {
    final content = line.substring(2, line.length - 2).trim();
    return MathBlock(latex: content);
  }

  static bool _isAlignLatex(String line) {
    return line.contains(r'\begin{align') && line.contains(r'\end{align');
  }
  
  static MarkdownBlock parseMultiLineLatex(String input) {
    // .replaceAllMapped(RegExp(r'\\begin\{(\w+)\*\}'), (m) => r'\begin{${m[1]}}')
    //         .replaceAllMapped(RegExp(r'\\end\{(\w+)\*\}'), (m) => r'\end{${m[1]}}');
    final tex = input.replaceAll(r'{align*}', r'{aligned}');
    return MathBlock(latex: tex, multiLine: true);
  }

  static MarkdownBlock parseList(String line) {
    final items = line
        .split('\n')
        .map((item) => item.trim().substring(2).trim()) // 移除 `- ` 或 `* `
        .toList();
    
    return ListItemBlock(items);
  }

  static bool _isImage(String line) {
    return line.startsWith('![');
  }

  static MarkdownBlock? parseImage(String line) {
    final pattern = RegExp(r'!\[([^\]]*)\]\(([^)\s]+)(?:\s+"([^"]*)")?\)');
    final match = pattern.firstMatch(line);
    if (match != null && match.groupCount >= 2) {
      final url = match.group(2)!.trim();
      final String stem = path.basenameWithoutExtension(url);
      final assetPath = path.join('assets', 'images', 'exercise','$stem.svg');
      return ImageBlock(assetPath);
    }
    return null;
  }

  static MarkdownBlock parseTable(String paragraph) {
    final rows = <List<String>>[];
    final lines = paragraph.split('\n').map((e) => e.trim()).toList();

    for (var line in lines) {
      if (line.startsWith('|') && line.endsWith('|')) {
        final cells = line
            .substring(1, line.length - 1)
            .split('|')
            .map((cell) => cell.trim())
            .toList();
        if (!isSeparatorRow(cells)) {
          rows.add(cells);
        }
      }
    }

    return TableBlock(rows);
  }

  static bool isSeparatorRow(List<String> row) {
    return row.every((cell) {
      final trimmed = cell.trim();
      return trimmed.isNotEmpty && trimmed.split('').every((c) => c == '-' || c == ':');
    });
  }

  static List<InlineElement> parseInlineElements(String text) {
    final result = <InlineElement>[];
    int start = 0;

    while (start < text.length) {
      int dollar = text.indexOf(r'$', start);
      if (dollar == -1) {
        result.add(InlineText(text.substring(start)));
        break;
      }

      // 添加前面的文本
      if (dollar > start) {
        result.add(InlineText(text.substring(start, dollar)));
      }

      int nextDollar = text.indexOf(r'$', dollar + 1);
      if (nextDollar == -1) {
        result.add(InlineText(text.substring(dollar)));
        break;
      }

      String latex = text.substring(dollar + 1, nextDollar);
      result.add(InlineMath(latex));

      start = nextDollar + 1;
    }

    return result;
  }
 }