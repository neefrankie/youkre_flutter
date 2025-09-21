import 'package:flutter/material.dart';

class TapCardView extends StatelessWidget {
  final GestureTapCallback onTap;
  final Widget child;

  const TapCardView({
    super.key,
    required this.onTap,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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