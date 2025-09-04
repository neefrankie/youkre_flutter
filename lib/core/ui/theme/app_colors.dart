import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color? background;
  final Color? contentBackground;

  const AppColors({
    this.background,
    this.contentBackground,
  });

  @override
  AppColors copyWith({Color? background, Color? contentBackground}) {
    return AppColors(
      background: background ?? this.background,
      contentBackground: contentBackground ?? this.contentBackground,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      background: Color.lerp(background, other.background, t),
      contentBackground: Color.lerp(contentBackground, other.contentBackground, t),
    );
  }

  // 可选：调试用
  @override
  String toString() => 'AppColors(background: $background, contentBackground: $contentBackground)';
}