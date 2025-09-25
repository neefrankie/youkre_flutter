import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class MathTexView extends StatelessWidget {
  final String latex;

  const MathTexView({
    super.key,
    required this.latex,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Math.tex(
          latex,
          mathStyle: MathStyle.display,
          textScaleFactor: 1.5,
        ),
    );
  }
}