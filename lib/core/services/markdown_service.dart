import 'package:flutter/material.dart';
import 'package:youkre_flutter/core/ui/widgets/math_widget.dart';
import 'package:youkre_flutter/core/ui/widgets/table_widget.dart';
import 'package:youkre_flutter/core/utils/markdown_parser.dart';

class MarkdownService {

  static final List<double> fontSizes = [28.0,24.0,20.0,18.0,16.0,14.0];

  static List<Widget> buildWidgets(String markdown) {
    final blocks = MarkdownParser.parse(markdown);
    return blocks.map(_blockToWidget).toList();
  }

  static Widget _blockToWidget(MarkdownBlock block) {
      if (block is HeadingBlock) {
        return Text(
          block.text,
          style: TextStyle(
            fontSize: fontSizes[block.level-1],
            fontWeight: block.level <= 3 ? FontWeight.bold : FontWeight.w600,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        );
      } else if (block is ParagraphBlock) {
        return SizedBox(
          width: double.infinity,
          child: Text(
            block.text,
            textAlign: TextAlign.start,
          ),
        );
      } else if (block is ListItemBlock) {
        return Column(
          children: block.items.map((item) {
            return Row(
              spacing: 8,
              children: [
                Text("•"),
                Text(item)
              ],
            );
          }).toList(),
        );
      } else if (block is MathBlock) {
        return MathBlockWidget(latex: block.latex);
      } else if (block is TableBlock) {
        return TableWidget(rows: block.cells);
      } else if (block is ImageBlock) {
        return Image(image: AssetImage(block.src));
      }

      return SizedBox();
    }
}