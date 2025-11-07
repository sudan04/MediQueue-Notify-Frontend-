import 'package:flutter/material.dart';
import 'package:medi_queue_notify/data/notifiers.dart'
    show selectedPageNotifier;
import 'package:medi_queue_notify/pages/notifications_page.dart';
import 'package:medi_queue_notify/pages/projects_page.dart';
import 'package:medi_queue_notify/pages/queue_overview.dart';
import 'package:medi_queue_notify/pages/staff_management.dart';
import 'package:medi_queue_notify/widgets/bottom_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> pages = [
    const QueueOverview(),
    const NotificationsPage(),
    const StaffManagement(),
    const ProjectsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
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
          body: pages[selectedPage],
          drawer: SafeArea(child: Drawer()),
        );
      },
    );
  }
}
