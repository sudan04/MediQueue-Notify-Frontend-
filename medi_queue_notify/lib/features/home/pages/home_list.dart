import 'package:flutter/material.dart';
import 'package:medi_queue_notify/features/dashboard/widgets/drawerr.dart';
import 'package:medi_queue_notify/features/home/pages/create_home.dart';
import 'package:medi_queue_notify/shared/widgets/home_list_table.dart';

class HomeList extends StatefulWidget {
  const HomeList({super.key});

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  final List<String> homes = ["Home1", "Home2", "Home3", "Home4", "Home5"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            "Home List",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,

        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: IconButton(
              onPressed: () async {
                String? home = await Navigator.push<String?>(
                  context,
                  MaterialPageRoute(builder: (context) => CreateHomePage()),
                );

                if (home != null) {
                  setState(() {
                    homes.add(home);
                  });
                }
              },
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),
      drawer: HomePageDrawer(),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [HomeListTable(homes: homes)],
        ),
      ),
    );
  }
}
