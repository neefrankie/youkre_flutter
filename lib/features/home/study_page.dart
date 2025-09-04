import 'package:flutter/material.dart';

class StudyPage extends StatelessWidget {
  String markdown = r"""
Inline equation: $y = ax + b$

Display equation: $$equation$$

根据**幂法则**：

$$
\frac{d}{dx}x^a = ax^{a-1}
$$

这里 a = 13，所以：

\begin{align*}
&\frac{d}{dx}x^{13} \\
= &13x^{13-1} \\
= &13x^{12}
\end{align*}
""";

  StudyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("data");
  }
}