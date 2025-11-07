import 'package:flutter/material.dart';

class StaffManagement extends StatefulWidget {
  const StaffManagement({super.key});

  @override
  State<StaffManagement> createState() => _StaffManagementState();
}

class _StaffManagementState extends State<StaffManagement> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(right: 20, left: 20, top: 5, bottom: 10),
      child: Column(
        children: [
          Text(
            "This is Welcome page",
            style: TextStyle(backgroundColor: Colors.blue, fontSize: 25),
          ),
        ],
      ),
    );
  }
}
