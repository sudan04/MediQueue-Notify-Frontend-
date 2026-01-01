import 'package:flutter/material.dart';
import 'package:medi_queue_notify/features/home/pages/create_home.dart';
import 'package:medi_queue_notify/features/tenant/pages/create_tenant.dart';
import 'package:medi_queue_notify/features/home/pages/home_list.dart';
import 'package:medi_queue_notify/features/patient/pages/patient_details_form_page.dart';
import 'package:medi_queue_notify/features/patient/pages/medical_notepad_page.dart';
import 'package:medi_queue_notify/features/patient/pages/patient_admissions_page.dart';
import 'package:medi_queue_notify/features/patient/pages/patient_handover_page.dart';
import 'package:medi_queue_notify/features/dashboard/pages/queue_overview.dart';
import 'package:medi_queue_notify/features/staff/staff_member_details_page.dart';
import 'package:medi_queue_notify/features/task/pages/task_form_page.dart';
import 'package:medi_queue_notify/features/dashboard/pages/home_page.dart';
import 'package:medi_queue_notify/features/auth/pages/payment_gateway_page.dart';
import 'package:medi_queue_notify/features/task/pages/task_management_page.dart';
import 'package:medi_queue_notify/features/tenant/pages/tenant_list.dart';
import 'package:medi_queue_notify/core/utils/lists.dart';

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
