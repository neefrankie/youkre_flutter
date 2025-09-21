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

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: _backgroundColor(
            context,
            isSelected: isSelected,
            isUserSelected: isUserSelected,
            isCorrect: isCorrect
        ),
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
            _leadingImage(
              isUserSelected: isUserSelected,
              isCorrect: isCorrect
            ),
            _buildContent(choice, isLatex)
          ],
        ),
      ),
    );
  }


  Widget _buildContent(String choice, bool isLatex) {
    if (isLatex) {
      return Math.tex(
        choice,
        mathStyle: MathStyle.text,
        textScaleFactor: 1.5,
      );
    }

    return Text(
      choice,
      maxLines: null,
      softWrap: true,
    );
  }

  // 右侧图标
  Widget _leadingImage({required bool isUserSelected, required bool isCorrect}) {
    // Only change icon on which user selected.
    if (!isUserSelected) {
      return Icon(Icons.check_box_outline_blank); // 占位，保持对齐
    }

    return Icon(
      isCorrect ? Icons.check : Icons.close,
      color: isCorrect ? Colors.green : Colors.red,
    );
  }

  // 计算背景色
  Color _backgroundColor(BuildContext context, {
    required bool isSelected,
    required bool isUserSelected,
    required bool isCorrect
  }) {
    if (isSelected) {
      if (isCorrect) {
        return Colors.green.withAlpha(60);
      } else if (isUserSelected) {
        return Colors.red.withAlpha(60);
      }
    }
    return Theme.of(context).colorScheme.surfaceContainerHighest; // 类似 AppColors.contentBackground
  }
}