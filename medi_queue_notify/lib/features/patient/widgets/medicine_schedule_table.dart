import 'package:flutter/material.dart';
import 'package:medi_queue_notify/Model/demo/medicine.dart';

class MedicineScheduleTable extends StatelessWidget {
  final List<Medicine> medicines;

  const MedicineScheduleTable({super.key, required this.medicines});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor: MaterialStateProperty.all(
          Colors.blueGrey.shade50,
        ), // optional
        columns: const [
          DataColumn(label: Text('Medicine')),
          DataColumn(label: Text('Schedule')),
          DataColumn(label: Text('')),
        ],
        rows: medicines.map<DataRow>((med) {
          return DataRow(
            cells: [
              DataCell(Text(med.name)),

              DataCell(Text(med.schedule)),
              DataCell(
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit)),

                    IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                  ],
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
