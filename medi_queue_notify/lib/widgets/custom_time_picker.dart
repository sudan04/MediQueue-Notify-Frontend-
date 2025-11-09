import 'package:flutter/material.dart';

class CustomTimePicker extends StatelessWidget {
  final String labelText;
  final TimeOfDay? selectedTime;
  final ValueChanged<TimeOfDay?> onTimeSelected;

  const CustomTimePicker({
    super.key,
    required this.labelText,
    required this.selectedTime,
    required this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 16,
            color: selectedTime != null ? Colors.black87 : Colors.grey[600],
          ),
        ),
        const SizedBox(height: 8),

        GestureDetector(
          onTap: () async {
            final TimeOfDay? picked = await showTimePicker(
              context: context,
              initialTime: selectedTime ?? TimeOfDay.now(),
            );

            if (picked != null) {
              onTimeSelected(picked);
            }
          },

          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),

            child: Row(
              children: [
                const Icon(Icons.access_time),
                const SizedBox(width: 12),

                Text(
                  selectedTime != null
                      ? selectedTime!.format(context)
                      : "Select $labelText",
                  style: TextStyle(
                    fontSize: 16,
                    color: selectedTime != null
                        ? Colors.black87
                        : Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
