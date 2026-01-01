import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final IconData? icon;
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;

  const CustomElevatedButton({
    super.key,                                        
    this.icon,
    required this.label,
    required this.onPressed,
    this.backgroundColor = const Color(0xFF00AEEF),
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: icon != null ? Icon(icon, color: textColor): null,
      label: Text(label, style: TextStyle(fontSize: 16, color: textColor)),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
      onPressed: onPressed,
    );
  }
}
