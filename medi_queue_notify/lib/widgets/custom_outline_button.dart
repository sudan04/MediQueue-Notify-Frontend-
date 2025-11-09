import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color borderColor;
  final Color textColor;

  const CustomOutlineButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.borderColor = Colors.grey,
    this.textColor = Colors.black87,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: Icon(icon),
      label: Text(label, style: const TextStyle(fontSize: 16)),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: borderColor, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        foregroundColor: textColor,
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
      onPressed: onPressed,
    );
  }
}
