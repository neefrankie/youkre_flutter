import 'package:flutter/material.dart';

class BottomSheetContainer extends StatelessWidget {
  final String? title;

  final Widget? leading;
  final Widget? titleWidget;
  final Widget? trailing;

  final VoidCallback onDismiss;
  final ScrollableWidgetBuilder builder;

  const BottomSheetContainer({
    super.key,
    required this.onDismiss,
    required this.title,
    required this.builder,
    this.leading,
    this.titleWidget,
    this.trailing,
  }) : assert(title != null || titleWidget != null, '必须提供 title 或 titleWidget');
  
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
        minChildSize: 0.2,
        initialChildSize: 0.85,
        maxChildSize: 0.95,
        builder: (context, scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                _buildHeader(),
                const Divider(height: 1, thickness: 1),
                Expanded(
                  child: builder(context, scrollController),
                ),
              ],
            ),
          );
        }
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leading ?? IconButton(onPressed: onDismiss, icon: const Icon(Icons.close)),
          titleWidget ?? Text(title!),
          trailing ?? const SizedBox(),
        ],
      ),
    );
  }
}