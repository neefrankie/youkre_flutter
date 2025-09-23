import 'package:flutter/material.dart';
import 'package:youkre_flutter/features/exercise/summary_action.dart';

class SummaryPage extends StatelessWidget {
  final int total;
  final int score;
  final bool hasNextLevel;

  const SummaryPage({
    super.key,
    required this.total,
    required this.score, required this.hasNextLevel
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('总结'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text('🎉完成本节练习'),
            Text(
              '答对 $score / $total',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                FilledButton(
                  onPressed: () {
                    Navigator.pop(context, SummaryAction.restart);
                  },
                  child: Text('再做一遍'),
                ),
                SizedBox(width: 16,),
                _nextOrFinishButton(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _nextOrFinishButton(BuildContext context) {
    if (hasNextLevel) {
      return FilledButton(
        onPressed: () {
          Navigator.pop(context, SummaryAction.nextLevel);
        },
        child: Text('下一节'),
      );
    }

    return OutlinedButton(
      onPressed: () {
        Navigator.pop(context, SummaryAction.exit);
      },
      child: Text('已完成所有练习'),
    );
  }
}