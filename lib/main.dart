import 'package:flutter/material.dart';
import 'package:youkre_flutter/core/services/database_service.dart';
import 'package:youkre_flutter/core/services/preference_service.dart';

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

  runApp(const App());
}

