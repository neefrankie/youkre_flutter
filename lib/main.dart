import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youkre_flutter/core/data/database.dart';
import 'package:youkre_flutter/core/services/database_service.dart';
import 'package:youkre_flutter/core/services/preference_service.dart';
import 'package:youkre_flutter/core/services/theme_manager.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = PreferenceService();
  await prefs.init();

  final dbService = DatabaseService();
  final success = await dbService.ensureDatabaseCopied();
  if (!success) {
    print('DB initialization failed. App cannot run.');
  }

  final dbPath = await dbService.getDatabasePath();
  print('db path: $dbPath');

  final themeManager = ThemeManager();

  AppDatabase.instance();
  runApp(
    ChangeNotifierProvider.value(
      value: themeManager,
      child: const App(),
    )
  );
}

