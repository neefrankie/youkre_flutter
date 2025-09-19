import 'package:flutter/material.dart';
import 'package:youkre_flutter/core/data/exercise_data_source.dart';
import 'package:youkre_flutter/core/models/course.dart';

class BookListViewModel extends ChangeNotifier {
  List<Course> courses = [];
  bool isLoading = true;
  String? error;

  Future<void> loadData() async {
    isLoading = true;
    notifyListeners();

    try {
      final courses = await ExerciseDataSource().loadCourses();
      this.courses = courses;
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