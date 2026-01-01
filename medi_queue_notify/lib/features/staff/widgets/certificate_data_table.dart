import 'package:flutter/material.dart';

class CertificateDataTable extends StatelessWidget {
  final List certificates;

  const CertificateDataTable({super.key, required this.certificates});

  Color _getStatusColor(String status) {
    switch (status) {
      case "Active":
        return Colors.blue;
      case "Expired":
        return Colors.red;
      case "Pending":
        return Colors.grey;
      default:
        return Colors.black54;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor: MaterialStateProperty.all(
          Colors.blueGrey.shade50,
        ), // optional
        columns: const [
          DataColumn(label: Text('Certificate Name')),
          DataColumn(label: Text('Issue Date')),
          DataColumn(label: Text('Status')),
        ],
        rows: certificates.map<DataRow>((c) {
          return DataRow(
            cells: [
              DataCell(Text(c.name)),
              DataCell(
                Text(
                  "${c.issueDate.year}-${c.issueDate.month.toString().padLeft(2, '0')}-${c.issueDate.day.toString().padLeft(2, '0')}",
                ),
              ),
              DataCell(
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(c.status),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    c.status,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
