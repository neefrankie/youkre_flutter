import 'package:flutter/material.dart';
import 'package:youkre_flutter/features/settings/app_info.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String _version = '...';

  @override
  void initState() {
    super.initState();
    _loadVersion();
  }

  Future<void> _loadVersion() async {
    final version = await AppInfo.getAppVersion(); // 1.2.3+4
    if (mounted) {
      setState(() {
        _version = version;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('关于'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            PhysicalModel(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10.0), // 圆角半径
              clipBehavior: Clip.antiAlias,
              child:  Image(
                image: AssetImage('assets/images/logos/youkre-icon.png'),
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 8),
            Text("优克"),
            SizedBox(height: 8),
            Text('版本 $_version'),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
