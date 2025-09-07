import 'package:youkre_flutter/core/utils/datetime.dart';

class DailyExerciseInfo {
  final String exerciseId;
  final String lastDate;
  final int? selectedIndex;

  const DailyExerciseInfo({
    required this.exerciseId,
    required this.lastDate,
    this.selectedIndex,
  });

  DailyExerciseInfo.today({
    required this.exerciseId,
    this.selectedIndex,
  }) : lastDate = getCurrentDateAsString();
}

