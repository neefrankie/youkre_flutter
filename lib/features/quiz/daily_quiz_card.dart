import 'package:flutter/material.dart';
import 'package:youkre_flutter/core/ui/theme/app_colors.dart';
import 'package:youkre_flutter/core/ui/widgets/markdown_view.dart';
import 'package:youkre_flutter/features/quiz/daily_quiz_page.dart';
import 'package:youkre_flutter/core/models/exercise.dart';

class DailyQuizCard extends StatelessWidget {
  final Exercise exercise;

  const DailyQuizCard({
    super.key,
    required this.exercise,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>();

    return Card(
        color: appColors?.contentBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.zero,
        // margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DailyQuizPage(exercise: exercise)
              ),
            );
          },
          // child: MarkdownView(markdown: exercise.prompts),
          child: Container(
            padding: EdgeInsets.all(16),
            child: MarkdownView(markdown: exercise.prompts),
          )
        )
    );
  }
}


