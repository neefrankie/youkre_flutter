import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class DatabaseService {
  DatabaseService._();
  static final DatabaseService _instance = DatabaseService._();
  factory DatabaseService() => _instance;

  static const String _dbAssetPath = 'assets/db/db.sqlite3';
  static const String _dbName = 'course.db';
  static const int _currentVersion = 1;

  static const String _prefsKey = 'db_initialized';
  static const String _versionKey = 'db_version';

  Future<bool> ensureDatabaseCopied() async {
    final prefs = await SharedPreferences.getInstance();
    final int savedVersion = prefs.getInt(_versionKey) ?? 0;

    if (prefs.getBool(_prefsKey) == true && savedVersion >= _currentVersion) {
      return true;
    }

    try {
      final appDocDir = await getApplicationDocumentsDirectory();
      final dbPath = path.join(appDocDir.path, _dbName);

      if (File(dbPath).existsSync()) {
        await File(dbPath).delete();
      }

      final data = await rootBundle.load(_dbAssetPath);
      final bytes = data.buffer.asUint8List();
      await File(dbPath).writeAsBytes(bytes);

      await prefs.setBool(_prefsKey, true);
      await prefs.setInt(_versionKey, _currentVersion);

      return true;
    } on Exception catch (e) {
      print("failed to copy db: $e");
      return false;
    }
  }

  Future<String> getDatabasePath() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    return path.join(appDocDir.path, _dbName);
  }
}