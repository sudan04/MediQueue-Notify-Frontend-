import 'package:flutter/material.dart';
import 'package:medi_queue_notify/pages/forms/staff_member_details_page.dart';
import 'package:medi_queue_notify/pages/home_page.dart';
import 'package:medi_queue_notify/pages/patient_admission.dart';

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
                      builder: (context) => StaffMemberDetailsPage(title: "Staff Member Details",),
                    ),
                  );
                },
                child: Text("Staff Details"),
              ),
              TextButton(onPressed: () {}, child: Text("")),
            ],
          ),
        ),
      ),
    );
  }
}
