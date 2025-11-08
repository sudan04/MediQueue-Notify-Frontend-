import 'package:flutter/material.dart';
import 'package:medi_queue_notify/Model/staff.dart';
import 'package:medi_queue_notify/data/notifiers.dart'
    show selectedPageNotifier;
import 'package:medi_queue_notify/pages/forms/staff_member_details_page.dart';
import 'package:medi_queue_notify/pages/notifications_page.dart';
import 'package:medi_queue_notify/pages/projects_page.dart';
import 'package:medi_queue_notify/pages/queue_overview.dart';
import 'package:medi_queue_notify/pages/staff_management.dart';
import 'package:medi_queue_notify/utils/lists.dart';
import 'package:medi_queue_notify/widgets/bottom_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, Widget>> pages = [
    {"Queue Overview":  QueueOverview()},
    {"Notifications":  NotificationsPage()},
    {"Staff Management": StaffManagement()},
    {"Projects":  ProjectsPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        final currentPage = pages[selectedPage];
        final pageTitle = currentPage.keys.first;
        final pageWidget = currentPage.values.first;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 60,
            elevation: 0,
            title: Text(
              pageTitle,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            leading: Builder(
              builder: (context) {
                return IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
          ),
          bottomNavigationBar: BottomNavigation(),
          body: pageWidget,
          drawer: SafeArea(child: Drawer()),
          floatingActionButton: selectedPage == 2
              ? FloatingActionButton.extended(
                  onPressed: () async {
                    // 👇 Navigate to AddStaffPage and wait for result
                    final newStaff = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StaffMemberDetailsPage(
                          title: "Staff Member Details",
                        ),
                      ),
                    );

                    // If the page returned a new staff object, add it to list
                    if (newStaff != null && newStaff is Staff) {
                      // Find the StaffManagement widget and update its list

                      setState(() {
                        Lists.allStaff.add(newStaff);
                      });
                    }
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Add Staff"),
                )
              : null,
        );
      },
    );
  }
}
