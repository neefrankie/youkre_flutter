import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youkre_flutter/core/services/sheet_manager.dart';
import 'package:youkre_flutter/core/ui/widgets/bottom_sheet.dart';
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
  final PageController _pageController = PageController();

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

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: widget.courseViewModel),
        ChangeNotifierProvider(
          create: (_) {
            final vm = LevelDetailViewModel();
            vm.loadData(
              course: widget.courseViewModel.course,
              level: widget.courseViewModel.currentLevel,
              courseSession: widget.courseViewModel.courseSession,
            );
            widget.courseViewModel.updateSession();
            return vm;
          },
        ),
      ],
      child: Consumer<CourseViewModel>(
        builder: (context, vm, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(vm.navTitle),
              actions: [_buildNextButton(context)],
            ),
            body: _buildBody(context),
            // bottomNavigationBar: _isLastAnswered ? finishButton() : null,
            bottomNavigationBar: SafeArea(
              bottom: true,
              top: false,
              child: ExerciseBottomBar(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    final vm = context.watch<LevelDetailViewModel>();
    return TextButton(
      onPressed: () {
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
    return Column(children: [Text(vm.progressText), swipingPage(context)]);
  }

  Widget swipingPage(BuildContext context) {
    final courseVm = context.watch<CourseViewModel>();
    final vm = context.watch<LevelDetailViewModel>();
    // Expanded 必须包裹 PageView，否则 Column 会无限高。
    return Expanded(
      child: PageView.builder(
        controller: _pageController,
        itemCount: vm.exercises.length,
        physics: const AlwaysScrollableScrollPhysics(),
        onPageChanged: vm.onPageChanged,
        itemBuilder: (context, index) {
          final exercise = vm.currentExercise;
          final levelProgress = vm.levelProgress;
          final courseSession = courseVm.courseSession;

          if (exercise == null) {
            return Text('Error: no exercise found');
          }
          if (levelProgress == null) {
            return Text('Error: no level progress');
          }
          if (courseSession == null) {
            return Text('Error: not course session');
          }

          return ExerciseDetailView(
            exercise: exercise,
            levelProgress: levelProgress,
            courseSession: courseSession,
            isLast: vm.isLast,
            onSummary: () {
              _presentSummary(context);
            },
            onAnswer: (ExerciseProgress progress) {
              _onExerciseAnswered(context, progress);
            },
          );
        },
      ),
    );
  }

  Future<void> _onExerciseAnswered(
    BuildContext context,
    ExerciseProgress exerciseProgress,
  ) async {
    final vm = context.watch<LevelDetailViewModel>();
    final courseVm = context.watch<CourseViewModel>();

    await vm.updateLevelProgress(exerciseProgress);

    final levelProgress = vm.levelProgress;
    if (levelProgress != null && levelProgress.isCompleted) {
      courseVm.addCompletedLevel(levelProgress);
    }
  }

  void _presentSummary(BuildContext context) {
    final vm = context.watch<LevelDetailViewModel>();

    SheetManager.presentSheet(
      context,
      child: BottomSheetContainer(
        onDismiss: () {
          SheetManager.dismiss(context);
        },
        title: '总结',
        builder: (context, scrollController) {
          return Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('🎉完成本节练习'),
                Text(
                  '答对 ${vm.levelProgress?.score} / ${vm.levelProgress?.total}',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FilledButton(
                      onPressed: () {
                        _onRestart(context);
                        SheetManager.dismiss(context);
                      },
                      child: Text('再做一遍'),
                    ),
                    _nextOrFinishButton(context),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _nextOrFinishButton(BuildContext context) {
    final courseVm = context.watch<CourseViewModel>();
    if (courseVm.hasNextLevel) {
      return FilledButton(
        onPressed: () {
          _onNextLevel(context);
          SheetManager.dismiss(context);
        },
        child: Text('下一节'),
      );
    }

    return OutlinedButton(
      onPressed: () {
        _onFinish();
      },
      child: Text('已完成所有练习'),
    );
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

    SheetManager.dismiss(context);
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

    SheetManager.dismiss(context);
  }

  void _onFinish() {
    SheetManager.dismiss(context);
    Navigator.pop(context);
  }
}
