import 'package:flutter/material.dart';
import 'package:medi_queue_notify/Model/demo/staff.dart';
import 'package:medi_queue_notify/core/utils/lists.dart';
import 'package:medi_queue_notify/features/dashboard/widgets/drawerr.dart';
import 'package:medi_queue_notify/features/staff/staff_member_details_page.dart';
import 'package:medi_queue_notify/features/staff/widgets/staff_tile.dart';

class StaffManagement extends StatefulWidget {
  const StaffManagement({super.key});

  @override
  State<StaffManagement> createState() => _StaffManagementState();
}

class _StaffManagementState extends State<StaffManagement>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  List<Staff> getFilteredStaff(String role) {
    return Lists.allStaff
        .where(
          (staff) =>
              staff.role == role &&
              staff.name!.toLowerCase().contains(
                _searchController.text.toLowerCase(),
              ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Staff Management",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StaffMemberDetailsPage(),
                ),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Doctors'),
              Tab(text: 'Nurses'),
              Tab(text: 'Other Staff'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search by name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (_) => setState(() {}),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  children: getFilteredStaff('Doctor')
                      .map(
                        (staff) =>
                            StaffTile(staff: staff, onViewDetails: () {}),
                      )
                      .toList(),
                ),
                ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  children: getFilteredStaff('Nurse')
                      .map(
                        (staff) =>
                            StaffTile(staff: staff, onViewDetails: () {}),
                      )
                      .toList(),
                ),
                ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  children: getFilteredStaff('Supporting Staff')
                      .map(
                        (staff) =>
                            StaffTile(staff: staff, onViewDetails: () {}),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: HomePageDrawer(),
    );
  }
}
