import 'package:flutter/material.dart';
import 'package:medi_queue_notify/Model/tenant.dart';

class TenantListTable extends StatelessWidget {
  const TenantListTable({super.key, required this.tenants});
  final List<Tenant> tenants;

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
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor: MaterialStateProperty.all(Colors.blue.shade50),
              columns: const [
                DataColumn(label: Text('NAME')),
                DataColumn(label: Text('PHONE')),
                DataColumn(label: Text('ADMIN')),
                DataColumn(label: Text('ACTIONS')),
              ],
              rows: tenants.map<DataRow>((t) {
                return DataRow(
                  cells: [
                    DataCell(
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundImage: NetworkImage(t.logoUrl),
                          ),
                          SizedBox(width: 8),
                          Text(t.name),
                        ],
                      ),
                    ),
                    DataCell(Text(t.phone.toString())),

                    DataCell(
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundImage: NetworkImage(t.admin.imageUrl!),
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(t.admin.name ?? ""),
                              Text(
                                "Doctor",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
