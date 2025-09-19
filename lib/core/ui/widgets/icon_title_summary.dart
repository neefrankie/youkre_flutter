import 'package:flutter/material.dart';
import 'package:youkre_flutter/core/ui/widgets/title_summary_view.dart';

class IconTitleSummaryRow extends StatelessWidget {
  final String title;
  final String? summary;
  final Widget? icon;
  final double iconSize;
  final Color? iconColor;

  const IconTitleSummaryRow({
    super.key,
    required this.title,
    this.summary,
    this.icon,
    this.iconSize = 20,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (icon != null)
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconTheme(
                data: IconThemeData(
                  size: iconSize,
                  color: iconColor ?? Theme.of(context).colorScheme.primary
                ),
                child: icon!,
            ),
          ),
        Expanded(
          child: TitleSummaryView(title: title, summary: summary),
        )
      ],
    );
  }

}