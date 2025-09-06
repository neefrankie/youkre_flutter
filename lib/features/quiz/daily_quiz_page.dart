import 'package:flutter/material.dart';
import 'package:youkre_flutter/core/models/exercise.dart';
import 'package:youkre_flutter/features/exercise/exercise_view.dart';

class DailyQuizPage extends StatefulWidget {
  final Exercise exercise;

  const DailyQuizPage({super.key, required this.exercise});

  @override
  State<DailyQuizPage> createState() => _DailyQuizState();
}

class _DailyQuizState extends State<DailyQuizPage> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily quiz'),
      ),
      body: ExerciseView(
        exercise: widget.exercise,
        selectedIndex: _selectedIndex,
        onClick: _checkAnswer,
      ),
    );
  }

  void _checkAnswer(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}


