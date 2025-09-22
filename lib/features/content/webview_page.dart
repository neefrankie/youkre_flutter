import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import 'package:youkre_flutter/core/services/theme_manager.dart';

class WebViewPage extends StatefulWidget {
  final String title;
  final String courseSlug;
  final String chapterSlug;

  const WebViewPage({
    super.key,
    required this.courseSlug,
    required this.chapterSlug,
    required this.title
  });

  @override
  State<WebViewPage> createState() => _WebViewPageState();

}

class _WebViewPageState extends State<WebViewPage> {
  final InAppLocalhostServer _server = InAppLocalhostServer(
    port: 8080,
    documentRoot: 'assets/web'
  );
  bool _serverStared = false;

  @override
  void initState() {
    super.initState();
    _startServerIfNeeded();
  }

  Future<void> _startServerIfNeeded() async {
    if (!_serverStared) {
      try {
        await _server.start();
        _serverStared = true;
      } catch (e) {
        print('❌ Failed to start server: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: InAppWebView(
        // onLoadStart: (controller, url) async {
        //   await _startServerIfNeeded();
        // },
        initialUrlRequest: URLRequest(
          url: WebUri('http://localhost:8080/${widget.courseSlug}/${widget.chapterSlug}.html'),
        ),
        onLoadResource: (controller, resource) {
          print('Loaded: ${resource.url}');
        },
        // 可选：添加错误处理
        onReceivedError: (controller, request, error) {
          print(' onPageError: ${request.url}, message: $error');
        },
        onReceivedHttpError: (controller, request, response) {
          print(' onHttpError: ${request.url}, status: ${response.statusCode}');
        },
        onLoadStop: (controller, webUri) async {
          await controller.evaluateJavascript(source: themeManager.jsThemeScript);
        },
      ),
    );
  }

  @override
  void dispose() {
    if (_serverStared) {
      _server.close();
    }
    super.dispose();
  }

}