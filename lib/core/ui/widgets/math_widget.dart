import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

import '../../utils/markdown_parser.dart';

class MathBlockWidget extends StatelessWidget {
  final String latex;

  const MathBlockWidget({
    super.key,
    required this.latex,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Math.tex(
          latex,
          mathStyle: MathStyle.display,
          textScaleFactor: 1.5,
        ),
    );
  }
}

class MathInlineWidget extends StatelessWidget {
  final String paragraph;
  final TextStyle baseStyle = TextStyle(fontSize: 18.0, color: Colors.black);

  MathInlineWidget({super.key, required this.paragraph});

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
          child: Math.tex(
            elem.latex,
            mathStyle: MathStyle.text,
            textScaleFactor: 1.5,
          ),
        ));
      }
    }

    return widgets;
  }
}