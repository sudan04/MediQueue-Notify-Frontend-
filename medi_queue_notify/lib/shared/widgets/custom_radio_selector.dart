import 'package:flutter/material.dart';

class CustomRadioSelector extends StatelessWidget {
  final String labelText;
  final String? selectedItem;
  final ValueChanged<String> onChanged;
  final List<String> radioOptions;

  const CustomRadioSelector({
    super.key,
    this.selectedItem,
    required this.onChanged,
    required this.radioOptions,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: radioOptions
                .map((radio) => buildRadioOption(radio))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget buildRadioOption(String type) {
    return Row(
      children: [
        Radio<String>(
          value: type,
          groupValue: selectedItem,
          onChanged: (value) => onChanged(value!),
        ),
        Text(type),
      ],
    );
  }
}
