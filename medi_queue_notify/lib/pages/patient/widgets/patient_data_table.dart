import 'package:flutter/material.dart';

class PatientDataTable extends StatelessWidget {
  final List patients;

  const PatientDataTable({super.key, required this.patients});

  Color _getStatusColor(String status) {
    switch (status) {
      case "Admitted":
        return Colors.blue;
      case "Pending":
        return Colors.orange;
      case "Discharged":
        return Colors.grey;
      default:
        return Colors.black54;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
          ],
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: MaterialStateProperty.all(Colors.blue.shade50),
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Patient Name')),
              DataColumn(label: Text('Type')),
              DataColumn(label: Text('Admission Date')),
              DataColumn(label: Text('Status')),
            ],
            rows: patients.map<DataRow>((p) {
              return DataRow(
                cells: [
                  DataCell(Text(p.id)),
                  DataCell(Text(p.name)),
                  DataCell(Text(p.type)),
                  DataCell(Text(p.admissionDate)),
                  DataCell(
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _getStatusColor(p.status),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        p.status,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
}
