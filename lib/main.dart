import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:youkre_flutter/core/data/database.dart';
import 'package:youkre_flutter/core/services/database_service.dart';
import 'package:youkre_flutter/core/services/preference_service.dart';
import 'package:youkre_flutter/core/services/theme_manager.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Logger.root.level = kDebugMode ? Level.FINE : Level.WARNING;

  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      print('${record.level.name} [${record.loggerName}] ${record.message}');
    }
  });

  final prefs = PreferenceService();
  await prefs.init();

  final logger = Logger('main');
  final dbService = DatabaseService();
  final success = await dbService.ensureDatabaseCopied();
  if (!success) {
    logger.info('DB initialization failed. App cannot run.');
  }

  final dbPath = await dbService.getDatabasePath();
  logger.info('db path: $dbPath');

  final themeManager = ThemeManager();

  AppDatabase.instance();
  runApp(
    ChangeNotifierProvider.value(
      value: themeManager,
      child: const App(),
    )
  );
}

