import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

import '../../core/ui/widgets/math_widget.dart';
import '../../core/ui/widgets/table_widget.dart';

class TeXExamplePage extends StatelessWidget {
  TeXExamplePage({super.key});

  final double fontSize = 18.0;
  final TextStyle baseStyle = TextStyle(fontSize: 18.0, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        ElevatedButton(
            onPressed: () {
              final s = r'\begin{align*}';
              print(s.replaceAll(r'{align*}', r'{aligned}'));
            },
            child: Text('ReplaceAll align*')
        ),
        Math.tex(r'\frac{a}{b}', mathStyle: MathStyle.display),

        Math.tex(r'\dfrac{a}{b}', mathStyle: MathStyle.text, textScaleFactor: 1.3,),

        Text("Math.tex could only should a single line latex in display mode:"),

        Math.tex(
          r"""x = {-b \pm \sqrt{b^2-4ac} \over 2a}""",
          mathStyle: MathStyle.display,
          textScaleFactor: 2,
        ),

        Math.tex(r"""
\begin{aligned}
\frac{dy}{dx} &= 2x \\
&= 2 \times 2 \\
&= 4
\end{aligned}
""",
          textScaleFactor: 2,
        ),

        Math.tex(r"""
M =\begin{bmatrix}1 & 0 \\0 & 1\end{bmatrix}\begin{bmatrix}1 & 0 \\0 & 1\end{bmatrix}
""",

          textScaleFactor: 2,
        ),

        MathInlineWidget(paragraph: r"""This is inline latex powered by flutter_math_fork. It does not shrink the overall size every if there's a fraction: $\dfrac{a}{b}$."""),

        MathInlineWidget(paragraph: r'''When $a \ne 0$, there are two solutions to $ax^2 + bx + c = 0$  and they are:'''),

        MathBlockWidget(latex: r"""x = \dfrac{-b \pm \sqrt{b^2-4ac}}{2a}"""),

        TableWidget(
            rows: [
              ["1月", "1"],
              ["2月", "5"],
              ["3月", "11"],
              ["4月", "20"],
              ["5月", "26"],
              ["6月", "30"],
              ["7月", "30"],
              ["8月", "29"],
              ["9月", "25"],
              ["10月", "19"],
              ["11月", "10"],
              ["12月", "3"],
            ]
        ),


      ],
    );
  }
}