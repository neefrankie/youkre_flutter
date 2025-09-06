import 'package:flutter/material.dart';

class IconLabelButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final double iconSize;
  final double labelSize;
  final Color? color;

  const IconLabelButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.iconSize = 24,
    this.labelSize = 12,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: color,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: iconSize),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(fontSize: labelSize),
          ),
        ],
      ),
    );
  }
}