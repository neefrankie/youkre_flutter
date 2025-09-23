import 'package:flutter/material.dart';
import 'package:youkre_flutter/core/ui/widgets/markdown_view.dart';
import 'package:youkre_flutter/core/ui/widgets/tap_card_view.dart';
import 'package:youkre_flutter/features/quiz/quiz_detail_page.dart';
import 'package:youkre_flutter/core/models/exercise.dart';

class DailyQuizCard extends StatelessWidget {
  final Exercise exercise;

  const DailyQuizCard({
    super.key,
    required this.exercise,
  });

  @override
  Widget build(BuildContext context) {
    return TapCardView(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DailyQuizPage(exercise: exercise)
          ),
        );
      },
      child: MarkdownView(markdown: exercise.prompts),
    );
  }
}


