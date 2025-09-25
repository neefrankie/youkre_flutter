import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:logging/logging.dart';
import 'package:youkre_flutter/core/ui/widgets/inline_renderer.dart';
import 'package:youkre_flutter/core/ui/widgets/math_text_view.dart';
import 'package:youkre_flutter/core/ui/widgets/table_widget.dart';
import 'package:youkre_flutter/core/utils/inline_parser.dart';


class TeXDemoPage extends StatelessWidget {
  final logger = Logger('TeXDemoPage');

  TeXDemoPage({super.key});

  final double fontSize = 18.0;
  final TextStyle baseStyle = TextStyle(fontSize: 18.0, color: Colors.black);

  final lines = [
    'Easy to use',
    r'Supports *basic* styling',
    r'[Visit Apple](https://apple.com)',
    r'This is **bold** and $E=mc^2$',
    r'Escaped \$ not a formula',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TeX Demo'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ElevatedButton(
              onPressed: () {
                for (var line in lines) {
                  logger.info('Input: $line');
                  final elements = InlineParser.parse(line);
                  logger.info('Output: $elements\n');
                }
              },
              child: Text('Parse line')
          ),
          Math.tex(r'\frac{a}{b}', mathStyle: MathStyle.display),

          Math.tex(r'\dfrac{a}{b}', mathStyle: MathStyle.text, textScaleFactor: 1.3,),

          Text("Math.tex display mode:"),

          Math.tex(
            r"""x = {-b \pm \sqrt{b^2-4ac} \over 2a}""",
            mathStyle: MathStyle.display,
            textScaleFactor: 2,
          ),

          SizedBox(height: 16),
          Text(r'Math.tex cannot use \begin{align*}, but \begin{aligned} is fine. Make replacement should it occur.'),
          Math.tex(r"""
\begin{aligned}
\frac{dy}{dx} &= 2x \\
&= 2 \times 2 \\
&= 4
\end{aligned}
""",
            textScaleFactor: 2,
          ),

          SizedBox(height: 16),
          Math.tex(r"""
M =\begin{bmatrix}1 & 0 \\0 & 1\end{bmatrix}\begin{bmatrix}1 & 0 \\0 & 1\end{bmatrix}
""",

            textScaleFactor: 2,
          ),

          InlineMarkdownView(
              elements: InlineParser.parse(r"""This is inline latex powered by flutter_math_fork. It does not shrink the overall size even if there's a fraction: $\dfrac{a}{b}$.""")
          ),

          SizedBox(height: 16),
          InlineMarkdownView(
              elements: InlineParser.parse(r'''This paragraph contains markdown **bold**, *italic* and LaTeX $\frac{a}{b}$.''')
          ),

          Text('List items:'),

          SizedBox(height: 16),
          InlineMarkdownView(
            elements: InlineParser.parse(r'''When $a \ne 0$, there are two solutions to $ax^2 + bx + c = 0$  and they are:''')
          ),

          MathTexView(latex: r"""x = \dfrac{-b \pm \sqrt{b^2-4ac}}{2a}"""),

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
      ),
    );
  }
}