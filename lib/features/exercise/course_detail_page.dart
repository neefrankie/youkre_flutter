import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youkre_flutter/features/exercise/course_detail_viewmodel.dart';
import 'package:youkre_flutter/features/exercise/level_card.dart';
import 'package:youkre_flutter/features/exercise/level_detail_page.dart';

import 'package:youkre_flutter/core/models/course.dart';

class CourseDetailPage extends StatelessWidget {
  final Course course;

  const CourseDetailPage({
    super.key,
    required this.course
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: CourseDetailView(course: course),
      )
    );
  }
}

class CourseDetailView extends StatefulWidget {
  final Course course;

  const CourseDetailView({
    super.key,
    required this.course
  });

  @override
  State<CourseDetailView> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetailView> {
  late final CourseViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = CourseViewModel(course: widget.course);
    _viewModel.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Builder(
        builder: (context) {
          return Consumer<CourseViewModel>(
            builder: (context, vm, child) {
              return _buildBody(context);
            },
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final vm = context.watch<CourseViewModel>();

    if (vm.isLoading) {
      return const CircularProgressIndicator();
    }
    if (vm.error != null) {
      return Text('加载失败: ${vm.error}');
    }

    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: List.generate(vm.levels.length, (index) {
        final level = vm.levels[index];
        final completed = vm.isLevelCompleted(level.id);
        return LevelCard(
          index: index,
          level: level,
          isCompleted: completed,
          isLocked: false,
          onTap: () {
            vm.changeLevel(index);
            onTapLevel();
          },
        );
      }),
    );
  }

  void onTapLevel() {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => LevelDetailPage(
          courseViewModel: _viewModel,
        ),
      ),
    );
  }
}