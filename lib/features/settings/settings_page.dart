import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youkre_flutter/core/services/theme_manager.dart';
import 'package:youkre_flutter/features/settings/about_page.dart';
import 'package:youkre_flutter/features/settings/app_colors.dart';
import 'package:youkre_flutter/features/settings/privacy_page.dart';
import 'package:youkre_flutter/features/settings/user_agreement_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingPageState();

}

class _SettingPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("设置"),
      //   titleTextStyle: Theme.of(context).textTheme.titleLarge,
      //   titleSpacing: 0,
      // ),
      body: ListView(
        children: [
          _buildSection(
              context,
              children: [
                ListTile(
                  title: Text("选择主题"),
                  subtitle: Text(_getThemeModeLabel(themeManager.themeMode)),
                  onTap: () {
                    _showThemePicker(context, themeManager);
                  },
                ),
              ],
          ),

          _buildSection(
              context,
              children: [
                ListTile(
                  title: Text("隐私政策"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => PrivacyPage()
                        )
                    );
                  },
                ),
                _buildDivider(),
                ListTile(
                  title: Text("用户服务协议"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => UserAgreementPage()
                        )
                    );
                  },
                ),
              ]
          ),

          _buildSection(
            context,
            children: [
              ListTile(
                title: Text("关于"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => AboutPage()
                      )
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSection(
      BuildContext context,
      {
        String? title,
        required List<Widget> children
      }
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section 标题
        if (title != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[600],
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        )
      ],
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
      child: Container(
        height: 0.5,
        color: Colors.grey[300],
      ),
    );
  }

  String _getThemeModeLabel(ThemeMode mode) {
    return switch(mode) {
      ThemeMode.light => "浅色",
      ThemeMode.dark => "深色",
      ThemeMode.system => "跟随系统",
    };
  }

  void _showThemePicker(BuildContext context, ThemeManager manager) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text("选择主题"),
            children: ThemeColors.values.map((theme) {
              return SimpleDialogOption(
                onPressed: () {
                  manager.setThemeMode(theme.mode);
                  Navigator.pop(context);
                },
                child: _buildThemeOption(
                  title: theme.name,
                  selected: manager.themeMode == theme.mode,
                ),
              );
            }).toList(),
          );
        }
    );
  }

  Widget _buildThemeOption({
    required String title,
    required bool selected
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        if (selected) Icon(Icons.check, color: Colors.teal),
      ],
    );
  }
}