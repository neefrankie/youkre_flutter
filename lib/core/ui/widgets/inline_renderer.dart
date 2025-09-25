import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:youkre_flutter/core/utils/inline_parser.dart';

class InlineMarkdownView extends StatelessWidget {
  final List<InlineElement> elements;
  final TextStyle? baseStyle;
  final void Function(String url)? onTapLink;
  final Widget Function(String forumula)? inlineMathBuilder;

  const InlineMarkdownView({
    super.key,
    required this.elements,
    this.baseStyle,
    this.onTapLink,
    this.inlineMathBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: baseStyle ?? Theme.of(context).textTheme.bodyMedium,
        children: elements.map((e) => _buildSpan(context, e)).toList(),
      ),
    );
  }

  InlineSpan _buildSpan(BuildContext context, InlineElement element) {
    if (element is TextElement) {
      return TextSpan(text: element.text);
    }

    if (element is BoldElement) {
      return TextSpan(
        style: const TextStyle(fontWeight: FontWeight.bold),
        text: element.text,
      );
    }

    if (element is ItalicElement) {
      return TextSpan(
        style: const TextStyle(fontStyle: FontStyle.italic),
        text: element.text,
      );
    }

    if (element is InlineMathElement) {
      final custom = inlineMathBuilder?.call(element.formula);
      if (custom != null) {
        return WidgetSpan(child: custom);
      }

      return WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: Math.tex(
          element.formula,
          mathStyle: MathStyle.text,
          textScaleFactor: 1.2,
        ),
      );
    }

    return TextSpan(text: '');
  }
}
