import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:youkre_flutter/core/ui/widgets/inline_renderer.dart';
import 'package:youkre_flutter/core/utils/markdown_parser.dart';

class ListItemView extends StatelessWidget {
  final ListItemBlock block;

  const ListItemView({
    super.key,
    required this.block
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: block.items.map((inlineElements) {
        return Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '•',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8),
              Expanded(
                child: InlineMarkdownView(
                  elements: inlineElements,
                  baseStyle: Theme.of(context).textTheme.bodyMedium,
                  inlineMathBuilder: (formula) {
                    return LayoutBuilder(
                      builder: (context, constraints) {
                        return ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: constraints.maxWidth * 0.8,
                          ),
                          child: Center(
                            child: Math.tex(
                              formula,
                              mathStyle: MathStyle.text,
                              textScaleFactor: 1.2,
                            ),
                          ),
                        );
                      }
                    );
                  },
                )
              )
            ],
          ),
        );
      }).toList(),
    );
  }

}