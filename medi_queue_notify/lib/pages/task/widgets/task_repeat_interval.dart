import 'package:flutter/material.dart';

class TaskRepeatInterval extends StatelessWidget {
  final TextEditingController hourController;
  final TextEditingController minuteController;

  const TaskRepeatInterval({
    super.key,
    required this.hourController,
    required this.minuteController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Repeat Every",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Colors.white70),
                child: TextFormField(
                  controller: hourController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Hours',
                    hintText: '0',
                    prefixIcon: const Icon(Icons.timer_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                controller: minuteController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Minutes',
                  hintText: '0',
                  prefixIcon: const Icon(Icons.timer),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        Card(
          color: Colors.blue.shade50,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text(
              "Enter how often the task repeats (e.g. every 2 hours 30 minutes)",
              style: TextStyle(fontSize: 13, color: Colors.black87),
            ),
          ),
        ),
      ],
    );
  }
}
