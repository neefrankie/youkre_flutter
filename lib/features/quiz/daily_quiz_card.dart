import 'package:flutter/material.dart';
import 'package:youkre_flutter/core/ui/theme/app_colors.dart';
import 'package:youkre_flutter/core/ui/widgets/prompt_widget.dart';
import 'package:youkre_flutter/features/quiz/daily_quiz_detail.dart';
import 'package:youkre_flutter/features/quiz/models/exercise.dart';
import 'package:youkre_flutter/features/quiz/models/multiple_choice.dart';

class DailyQuizView extends StatefulWidget {
  const DailyQuizView({super.key});

  @override
  State<StatefulWidget> createState() => _DailyQuizViewState();
}

class _DailyQuizViewState extends State<DailyQuizView> {
  bool _isLoading = false;

  final Exercise exercise = Exercise(
    id: "test",
    levelId: "test-level",
    prompts: r"""
\begin{align*}
\frac{dy}{dx} &= 2x \\
&= 2 \times 2 \\
&= 4
\end{align*}
""",
    multipleChoice: MultipleChoice(
        choices: [
          'Option 1',
          'Option 2',
          'Option 3',
          'Option 4',
        ],
        correctIndex: 0
    ),
    explanation: 'This part give you a detailed explanation on how to solve this problem.'
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(16.0),
      child: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _content()
    );
  }

  Widget _content() {
    return Column(
      children: [
        ListTile(
          title: Text('每日一题'),
          trailing: IconButton(
              onPressed: () {

              },
              icon: Icon(Icons.settings)
          ),
        ),
        DailyQuizCard(
          exercise: exercise,
        ),
      ],
    );
  }
}

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
              MaterialPageRoute(builder: (context) => DailyQuizDetail(exercise: exercise)),
            );
          },
          // child: MarkdownView(markdown: exercise.prompts),
          child: PromptWidget(markdown: exercise.prompts)
        )
    );
  }
}


