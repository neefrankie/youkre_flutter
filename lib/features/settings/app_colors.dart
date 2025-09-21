import 'package:flutter/material.dart';

enum ThemeColors {
  light(name: '浅色', mode: ThemeMode.light),
  dark(name: '深色', mode: ThemeMode.dark),
  system(name: '跟随系统', mode: ThemeMode.system);

  const ThemeColors({
    required this.name,
    required this.mode,
  });

  final String name;
  final ThemeMode mode;
}