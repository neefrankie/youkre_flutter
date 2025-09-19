import 'package:flutter/material.dart';
import 'package:youkre_flutter/core/ui/widgets/markdown_view.dart';

class StudyPage extends StatelessWidget {

  const StudyPage({super.key});

  final String example = r"""
# Welcome to SwiftUI

## Welcome to SwiftUI

### Welcome to SwiftUI

This is a custom **Markdown** renderer.

- Easy to use
- Supports *basic* styling
- [Visit Apple](https://apple.com)

## Thanks for Reading

\[ \frac{dy}{dx} = u\, \frac{dv}{dx} + v\, \frac{du}{dx} \]

Order of Operations are:

* Parentheses (Brackets) first
* Exponents (Orders, Powers, Square Roots, etc.) next
* Multiplication and Division (left-to-right) next
* Addition and Subtraction (left-to-right) last

So we do the division and multiplication before the addition:

\begin{align*}
6 \div 3 = 2 \\
4 \times 2 = 8
\end{align*}

So 

\begin{align*}
&6 \div 3 + 4 \times 2 \\
= &2 + 8 \\
= &10
\end{align*}

$$
\frac{d}{dx}x^{13} = 13x^{12}
$$

| 科学 | 34 | 
| --- | --- |
| 英语 | 90 | 
| 历史 | 87 | 
| 数学 | 34 |  
| 地理 | 55 |""";

  @override
  Widget build(BuildContext context) {
    return MarkdownView(markdown: example, isScrollable: true);
  }
}