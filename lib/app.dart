import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youkre_flutter/core/services/theme_manager.dart';
import 'package:youkre_flutter/features/home/home_screen.dart';

import 'core/ui/theme/app_colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  final String title = '优克';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
      builder: (context, themeManager, child) {
        return MaterialApp(
          title: title,
          themeMode: themeManager.themeMode,
          theme: ThemeData.light().copyWith(
              extensions: <ThemeExtension<dynamic>>[
                const AppColors(
                  background: Color(0xFFF2F2F7),
                  contentBackground: Colors.white,
                )
              ]
          ),
          darkTheme: ThemeData.dark().copyWith(
              extensions: <ThemeExtension<dynamic>>[
                const AppColors(
                    background: Colors.black,
                    contentBackground: Color(0x001c1c1e)
                )
              ]
          ),
          home: HomeScreen(title: title),
        );
      }
    );

  }
}
