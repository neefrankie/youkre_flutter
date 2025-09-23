import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:youkre_flutter/core/models/exercise.dart';
import 'package:youkre_flutter/core/models/exercise_level.dart';
import 'package:youkre_flutter/features/exercise/summary_action.dart';
import 'package:youkre_flutter/features/exercise/summary_page.dart';
import 'package:youkre_flutter/features/exercise/viewmodel/course_viewmodel.dart';
import 'package:youkre_flutter/features/exercise/exercise_detail_view.dart';
import 'package:youkre_flutter/features/exercise/viewmodel/level_viewmodel.dart';

import 'package:youkre_flutter/core/models/course_session.dart';
import 'exercise_bottom_bar.dart';

class LevelDetailPage extends StatefulWidget {
  final CourseViewModel courseViewModel;

  const LevelDetailPage({super.key, required this.courseViewModel});

  @override
  State<LevelDetailPage> createState() => _LevelDetailPage();
}

class _LevelDetailPage extends State<LevelDetailPage> {
  final logger = Logger('LevelDetailPage');

  final PageController _pageController = PageController();
  SummaryAction? _pendingAction;

  @override
  void initState() {
    super.initState();
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.courseViewModel.updateSession();
    });

    return ChangeNotifierProvider(
      create: (_) {
        final vm = LevelDetailViewModel();
        vm.loadData(
          course: widget.courseViewModel.course,
          level: widget.courseViewModel.currentLevel,
          courseSession: widget.courseViewModel.courseSession,
        );
        return vm;
      },
      child: Consumer<LevelDetailViewModel>(
        builder: (context, vm, child) {

          final action = _pendingAction;
          if (action != null) {
            _pendingAction = null;

            switch (action) {
              case SummaryAction.restart:
                _onRestart(context);
                break;
              case SummaryAction.nextLevel:
                _onNextLevel(context);
                break;
              case SummaryAction.exit:
                if (context.mounted) {
                  SchedulerBinding.instance.addPostFrameCallback((_) {
                    if (context.mounted) Navigator.pop(context);
                  });
                }
                break;
            }
          }

          final level = widget.courseViewModel.currentLevel;
          final exercise = vm.currentExercise;

          return Scaffold(
            appBar: AppBar(
              title: Text(widget.courseViewModel.navTitle),
              actions: [_buildNextButton(context)],
            ),
            body: _buildBody(context),
            bottomNavigationBar: _buildBottomBar(level, exercise),
          );
        },
      ),
    );
  }

  Widget? _buildBottomBar(ExerciseLevel? level, Exercise? exercise) {
    if (level != null && exercise != null) {
      return SafeArea(
        bottom: true,
        top: false,
        child: ExerciseBottomBar(
          course: widget.courseViewModel.course,
          level: level,
          exercise: exercise
        ),
      );
    }

    return null;
  }

  Widget _buildNextButton(BuildContext context) {
    final vm = context.watch<LevelDetailViewModel>();
    return TextButton(
      onPressed: vm.isLast ? null : () {
        vm.advance();
        _goToPage(vm.currentPage);
      },
      child: Text('下一题'),
    );
  }

  Widget _buildBody(BuildContext context) {
    final vm = context.watch<LevelDetailViewModel>();
    if (vm.isLoading) {
      return const CircularProgressIndicator();
    }
    if (vm.error != null) {
      return Text('加载失败: ${vm.error}');
    }
    return Column(
      children: [
        Text(vm.progressText),
        _buildSwipingPage(context),
        if (vm.isLast && vm.lastAnswered) _finishButton(context)
      ],
    );
  }

  Widget _buildSwipingPage(BuildContext context) {
    final vm = context.watch<LevelDetailViewModel>();
    // Expanded 必须包裹 PageView，否则 Column 会无限高。
    return Expanded(
      child: PageView.builder(
        controller: _pageController,
        itemCount: vm.exercises.length,
        physics: const AlwaysScrollableScrollPhysics(),
        onPageChanged: vm.onPageChanged,
        itemBuilder: (context, index) {
          // I used to commit an error here by using
          // vm.currentExercise, resulting to all exercising
          // retrieving the same row.
          final exercise = vm.exercises[index];
          final levelProgress = vm.levelProgress;
          final courseSession = widget.courseViewModel.courseSession;

          if (levelProgress == null) {
            return Text('Error: no level progress');
          }
          if (courseSession == null) {
            return Text('Error: not course session');
          }
          // Since each exercise detail view retrieves its own progress
          // upon shown, each swipe resulting a new db query.
          return ExerciseDetailView(
            exercise: exercise,
            levelProgress: levelProgress,
            courseSession: courseSession,
            onAnswer: (ExerciseProgress progress) {
              vm.updateLevelProgress(progress);
            },
            // Used cached data.
            // Two points to cache: first time loaded; clicked a choice.
            cachedExerciseProgress: vm.getExerciseProgress(exercise.id),
          );
        },
      ),
    );
  }

  Widget _finishButton(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: FilledButton(
        onPressed: () {
          _navigateAndTakeAction(context);
        },
        child: const Text('完成'),
      ),
    );
  }

  Future<void> _navigateAndTakeAction(BuildContext context) async {
    final vm = Provider.of<LevelDetailViewModel>(context, listen: false);

    final action = await Navigator.push<SummaryAction>(
        context,
        MaterialPageRoute(
          builder: (context) => SummaryPage(
            total: vm.levelProgress?.total ?? 0,
            score: vm.levelProgress?.score ?? 0,
            hasNextLevel: widget.courseViewModel.hasNextLevel
          )
        )
    );

    if (!context.mounted) {
      return;
    }

    if (action != null) {
      setState(() {
        _pendingAction = action;
      });
    }
  }

  void _onRestart(BuildContext context) {
    final vm = context.watch<LevelDetailViewModel>();

    vm.restartCurrentLevel(
      level: widget.courseViewModel.currentLevel,
      session: widget.courseViewModel.courseSession,
      course: widget.courseViewModel.course,
    ).then((prevLevelProgress) {
      if (prevLevelProgress != null) {
        widget.courseViewModel.addCompletedLevel(prevLevelProgress);
      }
    });
  }

  void _onNextLevel(BuildContext context) {
    final vm = context.watch<LevelDetailViewModel>();

    final nextLevel = widget.courseViewModel.moveToNextLevel();

    vm.startNewLevel(
      level: nextLevel,
      session: widget.courseViewModel.courseSession,
      course: widget.courseViewModel.course,
    ).then((prevLevelProgress) {
      if (prevLevelProgress != null) {
        widget.courseViewModel.addCompletedLevel(prevLevelProgress);
      }
    });

    widget.courseViewModel.updateSession();
  }
}
