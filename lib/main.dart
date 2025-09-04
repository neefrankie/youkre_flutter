import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

import 'app.dart';

void main() async {
  await TeXRenderingServer.start();
  runApp(const App());
}



