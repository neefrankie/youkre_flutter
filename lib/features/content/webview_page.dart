import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:youkre_flutter/core/models/course.dart';
import 'package:youkre_flutter/core/models/toc_entry.dart';

class WebViewPage extends StatefulWidget {
  final Course course;
  final TocDisplayEntry entry;

  const WebViewPage({
    super.key,
    required this.course,
    required this.entry
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
  }

  Future<void> _startServerIfNeeded() async {
    if (!_serverStared) {
      await _server.start();
      _serverStared = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InAppWebView(
        onLoadStart: (controller, url) async {
          await _startServerIfNeeded();
        },
        initialUrlRequest: URLRequest(
          url: WebUri('http://localhost:8080/assets/web/${widget.course.slug}/${widget.entry.slug}.html'),
        ),
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