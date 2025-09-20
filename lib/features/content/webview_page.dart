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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.course.title),
      ),
      body: InAppWebView(
        // onLoadStart: (controller, url) async {
        //   await _startServerIfNeeded();
        // },
        initialUrlRequest: URLRequest(
          url: WebUri('http://localhost:8080/${widget.course.slug}/${widget.entry.slug}.html'),
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