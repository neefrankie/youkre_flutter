import 'package:flutter/material.dart';

class TitleSummaryView extends StatelessWidget {
  final String title;
  final String? summary;

  const TitleSummaryView({
    super.key,
    required this.title,
    this.summary
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
          textAlign: TextAlign.left,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        if (summary != null && summary!.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(
            summary!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
            textAlign: TextAlign.left,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ]

      ],
    );
  }
}