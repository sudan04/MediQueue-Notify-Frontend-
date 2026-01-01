import 'package:flutter/material.dart';

class DateRangePickerField extends StatelessWidget {
  final DateTimeRange? range;
  final VoidCallback onTap;

  const DateRangePickerField({
    super.key,
    required this.range,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            const Icon(Icons.date_range),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                range == null
                    ? "Admission Date Range"
                    : "${range!.start.toString().split(' ')[0]}  →  ${range!.end.toString().split(' ')[0]}",
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
