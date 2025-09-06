import 'package:flutter/material.dart';
import 'package:youkre_flutter/core/services/markdown_service.dart';

final List<double> fontSizes = [28.0,24.0,20.0,18.0,16.0,14.0];

class MarkdownView extends StatelessWidget {
  final String markdown;
  final bool isScrollable;
  final ScrollController? controller;

  const MarkdownView({
    super.key,
    required this.markdown,
    this.isScrollable = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final widgets = MarkdownService.buildWidgets(markdown);

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
}