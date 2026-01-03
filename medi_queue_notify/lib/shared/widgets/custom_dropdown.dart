import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final String labelText;
  final String hintText;
  final Widget Function(T) itemBuilder;
  final ValueChanged<T?> onChanged;
  final String? Function(T?)? validator;
  final T? initialValue;

  const CustomDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.itemBuilder,
    required this.onChanged,
    required this.labelText,
    required this.hintText,
    this.validator,
    this.initialValue,
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
            color: value != null ? Colors.black87 : Colors.grey[600],
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(color: Colors.white70),
          child: DropdownButtonFormField<T>(
            initialValue: initialValue,
            validator: validator,
            value: value,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
            ),
            isExpanded: true,
            hint: value == null ? Text(hintText) : null,
            items: items.map((item) {
              return DropdownMenuItem<T>(value: item, child: itemBuilder(item));
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
