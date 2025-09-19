import 'package:flutter/material.dart';
import 'package:youkre_flutter/core/data/exercise_data_source.dart';
import 'package:youkre_flutter/core/models/course.dart';
import 'package:youkre_flutter/core/models/toc_entry.dart';

class TocViewModel extends ChangeNotifier {
  List<TocDisplayEntry> tocDisplayEntries = [];
  bool isLoading = true;
  String? error;

  Future<void> loadData(Course course) async {
    isLoading = true;
    notifyListeners();

    try {
      final tocEntries = await ExerciseDataSource().findTocList(course);
      tocDisplayEntries = flattenToc(tocEntries);

      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      notifyListeners();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}