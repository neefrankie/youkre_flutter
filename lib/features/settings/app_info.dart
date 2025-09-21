import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  static Future<String> getAppVersion() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      // version: 1.2.3
      // buildNumber: 4
      return '${packageInfo.version}+${packageInfo.buildNumber}';
    } catch (e) {
      return 'unknown';
    }
  }

  // 只获取版本号（如 1.2.3）
  static Future<String> getVersion() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      return packageInfo.version; // e.g. "1.2.3"
    } catch (e) {
      return 'unknown';
    }
  }

  // 只获取构建号（如 4）
  static Future<String> getBuildNumber() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      return packageInfo.buildNumber; // e.g. "4"
    } catch (e) {
      return 'unknown';
    }
  }

  // 获取 App 名称
  static Future<String> getAppName() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      return packageInfo.appName; // e.g. "MyApp"
    } catch (e) {
      return 'unknown';
    }
  }

  // 获取包名（Android）或 Bundle ID（iOS）
  static Future<String> getPackageName() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      return packageInfo.packageName; // e.g. "com.example.myapp"
    } catch (e) {
      return 'unknown';
    }
  }
}