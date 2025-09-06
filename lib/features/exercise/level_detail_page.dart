import 'package:flutter/material.dart';
import 'package:youkre_flutter/core/models/course.dart';
import 'package:youkre_flutter/core/models/exercise.dart';
import 'package:youkre_flutter/core/models/exercise_level.dart';
import 'package:youkre_flutter/features/exercise/exercise_bottom_bar.dart';
import 'package:youkre_flutter/features/exercise/exercise_detail_page.dart';

class LevelDetailPage extends StatefulWidget {
  final Course course;
  final ExerciseLevel level;

  const LevelDetailPage({
    super.key,
    required this.course,
    required this.level
  });

  @override
  State<LevelDetailPage> createState() => _LevelDetailPage();
}

class _LevelDetailPage extends State<LevelDetailPage> {
  final PageController _pageController = PageController();

  // TODO: load from DB
  final List<Exercise> _exercises = [];
  int _currentPage = 0;
  bool _isLastAnswered = false;

  bool isLast() {
    return _currentPage == _exercises.length - 1;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level Detail Page'),
      ),
      body: Column(
        children: [
          progressIndicator(),
          swipingPage(),
        ],
      ),
      // bottomNavigationBar: _isLastAnswered ? finishButton() : null,
      bottomNavigationBar: SafeArea(
        bottom: true,
          top: false,
          child: ExerciseBottomBar(),
      ),
    );
  }

  Widget progressIndicator() {
    return Visibility(
      visible: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text('${_currentPage + 1}/${_exercises.length}'),
      ),
    );
  }

  Widget swipingPage() {
    // Expanded 必须包裹 PageView，否则 Column 会无限高。
    return Expanded(
      child: PageView.builder(
        controller: _pageController,
        itemCount: _exercises.length,
        physics: const AlwaysScrollableScrollPhysics(),
        onPageChanged: (int index) {
          setState(() {
            _currentPage = index;
          //   isLast = index == exercise.length - 1;
          });
        },
        itemBuilder: (context, index) {
          final exercise = _exercises[index];

          return ExerciseDetailView(
            level: widget.level,
            exercise: exercise,
            onAnswer: (index, isCorrect) {
              if (isLast()) {
                _isLastAnswered = true;
                // TODO: also check whether level is complete.
              }
            },
          );
        },
      ),
    );
  }

  Widget finishButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ElevatedButton(
        onPressed: () {
          // showModalBottomSheet(
          //   context: context,
          //   builder: (context) {
          //
          //   }
          // );
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          '完成',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}