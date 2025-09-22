import 'package:flutter/material.dart';
import 'package:youkre_flutter/core/models/course.dart';
import 'package:youkre_flutter/core/models/exercise.dart';
import 'package:youkre_flutter/core/models/exercise_level.dart';

import 'package:youkre_flutter/core/services/sheet_manager.dart';
import 'package:youkre_flutter/core/ui/widgets/bottom_sheet.dart';
import 'package:youkre_flutter/core/ui/widgets/icon_label_button.dart';
import 'package:youkre_flutter/core/ui/widgets/markdown_view.dart';
import 'package:youkre_flutter/features/content/webview_page.dart';

class ExerciseBottomBar extends StatelessWidget {
  final Course course;
  final ExerciseLevel level;
  final Exercise exercise;

  const ExerciseBottomBar({
    super.key,
    required this.course,
    required this.level,
    required this.exercise,
  });

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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebViewPage(
                      title: course.title,
                      courseSlug: level.courseSlug,
                      chapterSlug: level.chapterSlug,
                    ),
                  )
                );
              },
            ),
            // IconLabelButton(
            //   icon: Icons.share,
            //   label: '分享',
            //   onPressed: () {
            //
            //   },
            // ),
            if (exercise.explanation != null)
            IconLabelButton(
              icon: Icons.question_mark,
              label: '解析',
              onPressed: () { presentExplanation(context, exercise.explanation!); },
            ),
          ],
        )
      ],
    );
  }

  void presentExplanation(BuildContext context, String markdown) {
    SheetManager.presentSheet(
        context,
        child: BottomSheetContainer(
          onDismiss: () {
            SheetManager.dismiss(context);
          },
          title: '解析',
          builder: (context, scrollController) {
            return MarkdownView(
              markdown: markdown,
              isScrollable: true,
              controller: scrollController,
            );
          },
        ),
        isScrollControlled: true
    );
  }

}