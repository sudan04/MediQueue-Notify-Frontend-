import 'package:flutter/material.dart';
import 'package:medi_queue_notify/pages/forms/staff_member_details_page.dart';
import 'package:medi_queue_notify/pages/forms/task_page.dart';
import 'package:medi_queue_notify/pages/home_page.dart';
import 'package:medi_queue_notify/pages/patient_admission.dart';
import 'package:medi_queue_notify/pages/payment_gateway_page.dart';
import 'package:medi_queue_notify/pages/task_management.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PatientAdmission()),
                  );
                },
                child: Text("Patient_Admisson"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text("Home"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          StaffMemberDetailsPage(title: "Staff Member Details"),
                    ),
                  );
                },
                child: Text("Staff Details"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TaskPage()),
                  );
                },
                child: Text("Add Task"),
              ),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TaskManagement()),
                  );
                },
                child: Text("Task Management"),
              ),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentGatewayPage(),
                    ),
                  );
                },
                child: Text("Payment"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
