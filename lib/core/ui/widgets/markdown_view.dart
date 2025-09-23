import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logging/logging.dart';
import 'package:youkre_flutter/core/ui/widgets/math_widget.dart';
import 'package:youkre_flutter/core/ui/widgets/table_widget.dart';
import 'package:youkre_flutter/core/utils/markdown_parser.dart';

class MarkdownView extends StatelessWidget {
  final logger = Logger('MarkdownView');

  final String markdown;
  final bool isScrollable;
  final TextAlign titleAlign;
  final ScrollController? controller;

  MarkdownView({
    super.key,
    required this.markdown,
    this.isScrollable = false,
    this.titleAlign = TextAlign.center,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final widgets = _buildWidgets(context, markdown);

    if (isScrollable) {
      return ListView.separated(
        itemCount: widgets.length,
        controller: controller,
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return widgets[index];
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 16);
        },
      );
    }

    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  List<Widget> _buildWidgets(BuildContext context, String markdown) {
    final blocks = MarkdownParser.parse(markdown);
    return blocks.map((block) => _blockToWidget(context, block)).toList();
  }

  Widget _blockToWidget(BuildContext context, MarkdownBlock block) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    if (block is HeadingBlock) {
      TextStyle? style;
      TextAlign align = titleAlign;

      switch (block.level) {
        case 1:
          style = textTheme.displayLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.primary,
          );
        case 2:
          style = textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.primary,
          );
        case 3:
          style = textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          );
        default:
          style = textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          );
          align = TextAlign.start;
      }
      return Text(
        block.text,
        style: style,
        textAlign: align,
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
      logger.info('image: ${block.src}');
      return Center(
        child: SvgPicture.asset(block.src, fit: BoxFit.contain),
      );
    } else if (block is SeparatorBlock) {
      return Divider();
    }

    return SizedBox();
  }
}