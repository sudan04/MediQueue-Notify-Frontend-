import 'package:flutter/material.dart';
import 'package:medi_queue_notify/features/dashboard/widgets/queue_overview.dart';

import 'package:medi_queue_notify/features/dashboard/widgets/drawerr.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 60,
        elevation: 0,
        title: Text(
          "Queue Overview",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        // leading: Builder(
        //   builder: (context) {
        //     return IconButton(
        //       icon: Icon(Icons.menu),
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //     );
        //   },
        // ),
      ),
      // bottomNavigationBar: BottomNavigation(),
      body: QueueOverview(),
      drawer: SafeArea(child: HomePageDrawer()),
    );
  }
}
