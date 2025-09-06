import 'package:flutter/material.dart';

class SheetManager {
  static bool _isPresented = false;

  static Future<T?> presentSheet<T>(
    BuildContext context,
    {
      bool isScrollControlled = false,
      VoidCallback? onDismiss,
      required Widget child,
    }
  ) async {
    if (_isPresented) return null;

    _isPresented = true;

    final result = await showModalBottomSheet<T>(
        context: context,
        isScrollControlled: isScrollControlled,
        builder: (context) => child,
    );

    _isPresented = false;
    onDismiss?.call();

    return result;
  }

  static void dismiss(BuildContext context) {
    if (_isPresented) {
      Navigator.of(context).pop();
    }
  }
}