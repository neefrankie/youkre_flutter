import 'package:intl/intl.dart';

String getCurrentDateAsString() {
  final now = DateTime.now();
  return DateFormat('yyyy-MM-dd').format(now);
}