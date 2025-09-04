import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  final List<List<String>> rows;
  final Alignment alignment;

  const TableWidget({
    super.key,
    required this.rows,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.grey),
      children: rows.map((row) {
        return TableRow(
          children: row.map((cell) {
            return Container(
              padding: const EdgeInsets.all(4),
              alignment: alignment,
              constraints: const BoxConstraints(minWidth: 50),
              color: const Color(0xFFF8F8F8),
              child: Text(cell),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}