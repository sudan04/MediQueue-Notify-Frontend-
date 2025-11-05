import 'package:flutter/material.dart';
import 'package:medi_queue_notify/home/pages/patient_admission.dart';

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
              TextButton(onPressed: () {}, child: Text("")),
              TextButton(onPressed: () {}, child: Text("")),
              TextButton(onPressed: () {}, child: Text("")),
            ],
          ),
        ),
      ),
    );
  }
}
