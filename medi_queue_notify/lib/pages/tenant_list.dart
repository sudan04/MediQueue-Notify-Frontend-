import 'package:flutter/material.dart';
import 'package:medi_queue_notify/utils/lists.dart';
import 'package:medi_queue_notify/widgets/home_list_table.dart';
import 'package:medi_queue_notify/widgets/tenant_list_table.dart';

class TenantList extends StatefulWidget {
  const TenantList({super.key});

  @override
  State<TenantList> createState() => _TenantListState();
}

class _TenantListState extends State<TenantList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            "Tenant List",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,

        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: ElevatedButton.icon(
              onPressed: () {},
              label: Text("Create"),
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),  
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [TenantListTable(tenants: Lists.tenants)],
        ),
      ),
    );
  }
}
