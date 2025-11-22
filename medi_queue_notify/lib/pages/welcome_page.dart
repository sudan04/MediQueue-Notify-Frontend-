import 'package:flutter/material.dart';
import 'package:medi_queue_notify/pages/create_home.dart';
import 'package:medi_queue_notify/pages/create_tenant.dart';
import 'package:medi_queue_notify/pages/home_list.dart';
import 'package:medi_queue_notify/pages/patient/edit_patient_details.dart';
import 'package:medi_queue_notify/pages/patient/medical_notepad.dart';
import 'package:medi_queue_notify/pages/patient/patient_admissions_page.dart';
import 'package:medi_queue_notify/pages/patient/patient_handover.dart';
import 'package:medi_queue_notify/pages/queue_overview.dart';
import 'package:medi_queue_notify/pages/staff/staff_member_details_page.dart';
import 'package:medi_queue_notify/pages/task/task_page.dart';
import 'package:medi_queue_notify/pages/home_page.dart';
import 'package:medi_queue_notify/pages/auth/payment_gateway_page.dart';
import 'package:medi_queue_notify/pages/task/task_management.dart';
import 'package:medi_queue_notify/pages/tenant_list.dart';
import 'package:medi_queue_notify/utils/lists.dart';

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
                    MaterialPageRoute(
                      builder: (context) => EditPatientDetails(),
                    ),
                  );
                },
                child: Text("Edit patient details"),
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
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PatientAdmissionsPage(patients: Lists.patientList),
                    ),
                  );
                },
                child: Text("Patient Admissions"),
              ),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PatientHandover()),
                  );
                },
                child: Text("Patient Handover"),
              ),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MedicalNotepad()),
                  );
                },
                child: Text("Medical Notepad"),
              ),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeList()),
                  );
                },
                child: Text("Home List"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateHomePage()),
                  );
                },
                child: Text("Create Home"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TenantList()),
                  );
                },
                child: Text("Tenant List"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateTenant()),
                  );
                },
                child: Text("Tenant Creation"),
              ),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QueueOverview()),
                  );
                },
                child: Text("Queue Overview"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
