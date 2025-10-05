import 'package:flutter/material.dart';
import 'package:youkre_flutter/core/data/legal_terms.dart';
import 'package:youkre_flutter/core/ui/widgets/markdown_view.dart';

class UserAgreementPage extends StatelessWidget {
  const UserAgreementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("用户协议")),
      body: MarkdownView(
        markdown: LegalTerms.userAgreement,
        isScrollable: true,
      ),
    );
  }
}
