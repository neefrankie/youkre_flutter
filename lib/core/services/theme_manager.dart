// theme_manager.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager extends ChangeNotifier {
  static const String _keyThemeMode = 'theme_mode';

  late ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;

  ThemeManager() {
    // 初始化时从本地读取
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final mode = prefs.getInt(_keyThemeMode);

    _themeMode = switch (mode) {
      0 => ThemeMode.light,
      1 => ThemeMode.dark,
      2 || null => ThemeMode.system, // 默认跟随系统
      _ => ThemeMode.system,
    };

    notifyListeners(); // 触发 UI 更新
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyThemeMode, mode.index);

    _themeMode = mode;
    notifyListeners(); // 通知所有监听者更新 UI
  }
}