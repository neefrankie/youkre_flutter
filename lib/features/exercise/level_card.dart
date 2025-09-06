import 'package:flutter/material.dart';
import 'package:youkre_flutter/core/models/exercise_level.dart';

class LevelCard extends StatelessWidget {
  final int index;
  final ExerciseLevel level;
  final bool isCompleted;
  final bool isLocked;
  final GestureTapCallback onTap;

  const LevelCard({
    super.key,
    required this.index,
    required this.level,
    required this.isCompleted,
    required this.onTap,
    required this.isLocked
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      margin: EdgeInsets.zero,
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
      ),
      color: backgroundColor(colors),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildBadge(),
              buildText(colors),
            ],
          ),
        ),
      ),
    );
  }

  Color backgroundColor(ColorScheme colors) {
    if (isLocked) {
      return colors.surfaceContainerHighest;
    } else {
      return colors.surface;
    }
  }

  Color badgeColor() {
    if (isLocked) {
      return Colors.grey;
    } else if (isCompleted) {
      return Colors.green;
    } else {
      return Colors.teal;
    }
  }

  Widget badgeIconOrNumber() {
    if (isLocked) {
      return const Icon(Icons.local_activity, color: Colors.white, size: 16);
    } else if (isCompleted) {
      return const Icon(Icons.check, color: Colors.white, size: 16);
    } else {
      // return Icon(Icons.numbers, color: Colors.white);
      return Text(
        '${index+1}',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  Widget buildBadge() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: badgeColor()
      ),
      child: Center(
        child: badgeIconOrNumber(),
      ),
    );
  }

  Color textColor(ColorScheme colors) {
    if (isLocked) {
      return colors.onSurface.withAlpha(80);
    } else {
      return colors.onSurface;
    }
  }

  Widget buildText(ColorScheme colors) {
    return Text(
      '第${index+1}关',
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: textColor(colors),
      ),
    );
  }
}