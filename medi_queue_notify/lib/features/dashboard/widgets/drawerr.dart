import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_queue_notify/core/utils/lists.dart';
import 'package:medi_queue_notify/features/auth/bloc/auth_bloc.dart';
import 'package:medi_queue_notify/features/auth/pages/login_page.dart';
import 'package:medi_queue_notify/features/dashboard/pages/home_page.dart';
import 'package:medi_queue_notify/features/home/pages/home_list.dart';
import 'package:medi_queue_notify/features/patient/pages/patient_admissions_page.dart';
import 'package:medi_queue_notify/features/staff/staff_management.dart';
import 'package:medi_queue_notify/features/task/pages/task_management_page.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: 40),

          Row(
            children: [
              const SizedBox(width: 16),
              Image.asset("assets/images/icon.png", height: 60, width: 60),
              const SizedBox(width: 12),
              const Text(
                "MediQueue Notify",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const Divider(),

          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                ),

                ListTile(
                  leading: Icon(Icons.people),
                  title: Text("Staff Mangement"),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StaffManagement(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.personal_injury),
                  title: Text("Patient Management"),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PatientAdmissionsPage(patients: Lists.patientList),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.task),
                  title: Text("Task Management"),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => TaskManagement()),
                    );
                  },
                ),

                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Home Configuration"),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeList()),
                    );
                  },
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20,bottom: 30,right: 20),
            child: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthInitial) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  );
                }
              },
              child: GestureDetector(
                onTap: () => context.read<AuthBloc>().add(LogoutRequested()),
                child: Row(
                  children: [Icon((Icons.logout)), const Text("Logout")],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
