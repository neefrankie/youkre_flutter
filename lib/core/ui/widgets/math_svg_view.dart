import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:youkre_flutter/core/utils/markdown_parser.dart';

class MathSVGView extends StatelessWidget {
  final String latex;
  final double fontSize;

  const MathSVGView({
    super.key,
    required this.latex,
    this.fontSize = 18.0
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TeX2SVG(
        math: latex,
        formulaWidgetBuilder: (context, svg) {
          final height = _calculateHeight(latex, fontSize);
          return SvgPicture.string(
            svg,
            height: height,
            fit: BoxFit.contain,
            alignment: Alignment.center,
          );
        },
      ),
    );
  }

  // 独立函数：计算推荐高度
  double _calculateHeight(String latex, double fontSize) {
    String clean = latex.trim();

    final lineCount = countLatexLines(clean);

    if (lineCount == 1) {
      return fontSize * 2.8; // // 单行，支持分式/根号，略小于3避免留白
    } else {
      return fontSize * lineCount * 1.5; // 多行：每行 fontSize 高，+0.8 行间
    }
  }

  // 独立函数：计算行数
  int countLatexLines(String latex) {
    if (latex.isEmpty) return 1;

    int count = 0;
    int i = 0;
    bool fracSeen = false;
    while (i < latex.length - 1) {
      if (latex[i] == r'\' && latex[i+1] == r'\') {
        count++;
        i += 2;
        fracSeen = false;
      } else {
        // Detect \frac in a line once.
        if (!fracSeen && latex[i] == r'\' && latex.substring(i, i+5) == r'\frac') {
          count++;
          fracSeen = true;
        }
        i++;
      }
    }

    return count + 1;
  }
}

class MathInlineSVGView extends StatelessWidget {
  final String paragraph;
  final TextStyle baseStyle = TextStyle(fontSize: 18.0, color: Colors.black);

  MathInlineSVGView({super.key, required this.paragraph});

  @override
  Widget build(BuildContext context) {
    final elements = MarkdownParser.parseInlineElements(paragraph);
    return RichText(
      text: TextSpan(
        style: baseStyle,
        children: buildTextWidgets(elements),
      ),
    );
  }

  List<InlineSpan> buildTextWidgets(List<InlineElement> elements) {
    final List<InlineSpan> widgets = [];

    for (var i = 0; i < elements.length; i++) {
      final elem = elements[i];

      if (elem is InlineText) {
        widgets.add(TextSpan(text: elem.text));
      } else if (elem is InlineMath) {
        widgets.add(WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: TeX2SVG(
            teXInputType: TeXInputType.teX,
            math: elem.latex,
          ),
        ));
      }
    }

    return widgets;
  }
}


