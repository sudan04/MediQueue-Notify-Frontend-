import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:medi_queue_notify/data/notifiers.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 30),
      child: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, value, child) {
          return GNav(
            color: Colors.black54,
            activeColor: Colors.black,
            tabActiveBorder: Border.all(color: Color(0xFFFAFAF3)),
            tabBackgroundColor: Color(0xD5EFEEFF),
            mainAxisAlignment: MainAxisAlignment.center,
            tabBorderRadius: 20,
            onTabChange: (value) => selectedPageNotifier.value = value,
            tabs: [
              GButton(icon: Icons.queue, text: 'Queue'),
              // GButton(icon: Icons.notifications, text: 'Alerts'),
              GButton(icon: Icons.people, text: 'Staff'),
              // GButton(icon: Icons.dashboard_outlined, text: 'Projects',),
            ],
          );
        },
      ),
    );
  }
}
