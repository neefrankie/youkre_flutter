import 'package:flutter/material.dart';
import 'package:youkre_flutter/core/ui/widgets/markdown_view.dart';

class ExplanationPage extends StatelessWidget {
  final String markdown;

  const ExplanationPage({
    super.key,
    required this.markdown
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('解析'),
      ),
      body: MarkdownView(
        markdown: markdown,
        isScrollable: true,
      ),
    );
  }

}