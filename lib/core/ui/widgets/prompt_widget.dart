import 'package:flutter/material.dart';
import 'package:youkre_flutter/core/ui/widgets/math_widget.dart';
import 'package:youkre_flutter/core/ui/widgets/table_widget.dart';
import 'package:youkre_flutter/core/utils/markdown_parser.dart';

final List<double> fontSizes = [28.0,24.0,20.0,18.0,16.0,14.0];

class PromptWidget extends StatefulWidget {
  final String markdown;

  const PromptWidget({super.key, required this.markdown});

  @override
  State<PromptWidget> createState() => _PromptWidgetState();

}

class _PromptWidgetState extends State<PromptWidget> {
  bool _isLoading = true;
  List<MarkdownBlock> _blocks = [];

  @override
  void initState() {
    super.initState();
    parse();
  }

  void parse() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(Duration.zero, () {
      final blocks = MarkdownParser.parse(widget.markdown);
      setState(() {
        _blocks = blocks;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: _isLoading
        ? const Center(child: CircularProgressIndicator())
        : Column(
          spacing: 16.0,
          children: _buildBlocks()
        ),
    );
  }

  List<Widget> _buildBlocks() {
    final widgets = <Widget>[];

    for (int i = 0; i < _blocks.length; i++) {
      final block = _blocks[i];

      if (block is HeadingBlock) {
        widgets.add(Text(
          block.text,
          style: TextStyle(
            fontSize: fontSizes[block.level-1],
            fontWeight: block.level <= 3 ? FontWeight.bold : FontWeight.w600,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ));
      } else if (block is ParagraphBlock) {
        widgets.add(SizedBox(
          width: double.infinity,
          child: Text(
            block.text,
            textAlign: TextAlign.start,
          ),
        ));
      } else if (block is ListItemBlock) {
        widgets.add(Column(
          children: block.items.map((item) {
            return Row(
              spacing: 8,
              children: [
                Text("•"),
                Text(item)
              ],
            );
          }).toList(),
        ));
      } else if (block is MathBlock) {
        widgets.add(MathBlockWidget(latex: block.latex));
        // if (block.multiLine) {
        //   widgets.add(MathSVGView(latex: block.latex));
        // } else {
        //
        // }
      } else if (block is TableBlock) {
        widgets.add(TableWidget(rows: block.cells));
      } else if (block is ImageBlock) {
        widgets.add(Image(image: AssetImage(block.src)));
      }
    }

    return widgets;
  }
}