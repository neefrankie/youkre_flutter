import 'package:flutter/material.dart';
import 'package:youkre_flutter/features/preview/markdown_demo.dart';
import 'package:youkre_flutter/features/preview/tex_demo_page.dart';

class PreviewList extends StatelessWidget {
  const PreviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Render markdown article'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => MarkdownDemoPage(),
                )
            );
          },
        ),
        ListTile(
          title: Text('LaTeX render'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => TeXDemoPage(),
              ),
            );
          },
        )
      ],
    );
  }
}