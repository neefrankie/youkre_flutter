import 'package:flutter/material.dart';
import 'package:youkre_flutter/core/data/legal_terms.dart';
import 'package:youkre_flutter/core/ui/widgets/markdown_view.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("隐私政策")),
      body: MarkdownView(
        markdown: LegalTerms.privacyPolicy,
        isScrollable: true,
      ),
    );
  }
}
