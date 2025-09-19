import 'package:flutter/material.dart';
import 'package:youkre_flutter/core/ui/theme/app_colors.dart';

class TextCardView extends StatelessWidget {
  final GestureTapCallback onTap;
  final Widget child;

  const TextCardView({
    super.key,
    required this.onTap,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>();

    return Card(
      color: appColors?.contentBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        child: Padding(
            padding: EdgeInsets.all(16),
          child: child,
        ),
      ),
    );
  }
}