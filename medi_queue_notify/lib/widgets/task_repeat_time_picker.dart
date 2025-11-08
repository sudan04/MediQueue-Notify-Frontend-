import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class TaskRepeatTimePicker extends StatefulWidget {
  const TaskRepeatTimePicker({super.key});

  @override
  State<TaskRepeatTimePicker> createState() => _TaskRepeatTimePickerState();
}

class _TaskRepeatTimePickerState extends State<TaskRepeatTimePicker> {

   int currentHour = 12;
  int currentMinute = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Repeat Every',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 12),
        Row(
          children: [
            // Hour Picker
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Hours',
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: NumberPicker(
                        value: currentHour,
                        minValue: 0,
                        maxValue: 23,
                        axis: Axis.horizontal,
                        textStyle: TextStyle(fontSize: 16, color: Colors.grey),
                        selectedTextStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                        onChanged: (value) =>
                            setState(() => currentHour = value),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: 20),

            // Minute Picker
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Minutes',
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: NumberPicker(
                        value: currentMinute,
                        minValue: 0,
                        maxValue: 59,
                        step: 1,
                        axis: Axis.horizontal,
                        textStyle: TextStyle(fontSize: 16, color: Colors.grey),
                        selectedTextStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                        onChanged: (value) =>
                            setState(() => currentMinute = value),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
