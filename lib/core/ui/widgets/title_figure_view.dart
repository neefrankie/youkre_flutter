import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TitleFigureView extends StatelessWidget {
  final String title;
  final String imagePath;

  const TitleFigureView({
    super.key,
    required this.title,
    required this.imagePath
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
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Expanded(
          child: SvgPicture.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}