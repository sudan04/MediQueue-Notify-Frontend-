import 'package:flutter/material.dart';

class HomeListTable extends StatelessWidget {
  HomeListTable({super.key});

  final List<String> homes = ["Home1", "Home2", "Home3", "Home4", "Home5"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: SizedBox(
          width: double.infinity,
          child: DataTable(
            headingRowColor: MaterialStateProperty.all(Colors.blue.shade50),
            columns: const [
              DataColumn(label: Text('NAME')),
              DataColumn(label: Text('ACTIONS')),
            ],
            rows: homes.map<DataRow>((h) {
              return DataRow(
                cells: [
                  DataCell(Text(h)),
                  DataCell(
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.more_horiz),
                      onSelected: (value) {},
                      itemBuilder: (context) => [
                        buildPopUpMenuItem("Edit", Icons.edit),
                        buildPopUpMenuItem("Delete", Icons.delete),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  PopupMenuEntry<String> buildPopUpMenuItem(String title, IconData icon) {
    return PopupMenuItem(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Icon(icon), Text(title)],
      ),
    );
  }
}
