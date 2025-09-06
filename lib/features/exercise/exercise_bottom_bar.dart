import 'package:flutter/material.dart';

import 'package:youkre_flutter/core/services/sheet_manager.dart';
import 'package:youkre_flutter/core/ui/widgets/bottom_sheet.dart';
import 'package:youkre_flutter/core/ui/widgets/icon_label_button.dart';
import 'package:youkre_flutter/core/ui/widgets/markdown_view.dart';

class ExerciseBottomBar extends StatelessWidget {
  const ExerciseBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconLabelButton(
              icon: Icons.menu_book,
              label: '了解更多',
              onPressed: () {

              },
            ),
            IconLabelButton(
              icon: Icons.share,
              label: '分享',
              onPressed: () {

              },
            ),
            IconLabelButton(
              icon: Icons.question_mark,
              label: '解析',
              onPressed: () { presentExplanation(context); },
            ),
          ],
        )
      ],
    );
  }

  void presentExplanation(BuildContext context) {
    SheetManager.presentSheet(
        context,
        child: BottomSheetContainer(
          onDismiss: () {
            SheetManager.dismiss(context);
          },
          title: '解析',
          builder: (context, scrollController) {
            return MarkdownView(
              markdown: "this is test",
              isScrollable: true,
              controller: scrollController,
            );
          },
        ),
        isScrollControlled: true
    );
  }

}