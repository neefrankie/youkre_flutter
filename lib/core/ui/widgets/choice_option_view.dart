import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class ChoiceOptionView extends StatelessWidget {
  final String choice;
  final bool isLatex;
  final int correctIndex;
  final int itemIndex;
  final int? selectedIndex;

  const ChoiceOptionView({
    super.key,
    required this.choice,
    required this.isLatex,
    required this.correctIndex,
    required this.itemIndex,
    this.selectedIndex
  });

  @override
  Widget build(BuildContext context) {
    // 判断是否已选中
    final bool isSelected = selectedIndex != null;
    final bool isCorrect = itemIndex == correctIndex;
    final bool isUserSelected = itemIndex == selectedIndex;

    // 计算背景色
    Color backgroundColor() {
      if (isSelected) {
        if (isCorrect) {
          return Colors.green.withAlpha(60);
        } else if (isUserSelected) {
          return Colors.red.withAlpha(60);
        }
      }
      return Theme.of(context).colorScheme.surfaceContainerHighest; // 类似 AppColors.contentBackground
    }

    // 右侧图标
    Widget leadingImage() {
      // Only change icon on which user selected.
      if (!isUserSelected) {
        return Icon(Icons.check_box_outline_blank); // 占位，保持对齐
      }

      return Icon(
        isCorrect ? Icons.check : Icons.close,
        color: isCorrect ? Colors.green : Colors.red,
      );
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: backgroundColor(),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            blurRadius: 2,
            color: Colors.black12,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          spacing: 8,
          children: [
            leadingImage(),
            isLatex
                ? Math.tex(
              choice,
              mathStyle: MathStyle.text,
            )
                : Text(
              choice,
              style: const TextStyle(color: Colors.black87),
              maxLines: null,
              softWrap: true,
            )
          ],
        ),
      ),
    );
  }
}