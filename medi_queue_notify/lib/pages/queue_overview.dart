import 'package:flutter/material.dart';
import 'package:medi_queue_notify/widgets/queue_info_card.dart';

class QueueOverview extends StatelessWidget {
  const QueueOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Queue Overview Cards
          Row(
            children: [
              QueueInfoCard(
                title: "Patients Waiting",
                value: "3",
                icon: Icons.people_alt,
                iconColor: Colors.redAccent,
              ),
              const SizedBox(width: 12),
              QueueInfoCard(
                title: "Avg. Wait Time",
                value: "12min",
                icon: Icons.timer,
                iconColor: Colors.blueAccent,
              ),
            ],
          ),

          const SizedBox(height: 20),

          // CCTV Status Card
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.videocam, color: Colors.blueAccent),
                    SizedBox(width: 10),
                    Text("CCTV Integration Status",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Active",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          const Text("Waiting Patients (3)",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),

          _patientTile(
            name: "Emily Chen",
            id: "P001",
            time: "5 min",
            status: "Waiting",
          ),
          _patientTile(
            name: "Sarah Kim",
            id: "P003",
            time: "15 min",
            status: "Waiting",
          ),
          _patientTile(
            name: "Michael Davis",
            id: "P005",
            time: "20 min",
            status: "Waiting",
          ),

          const SizedBox(height: 25),
          const Text("Recently Completed (1)",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),

          _patientTile(
            name: "John Miller",
            id: "P004",
            time: "Room 1",
            status: "Completed",
            completed: true,
          ),
        ],
      ),
    );
  }

  // Patient List Tile
  Widget _patientTile({
    required String name,
    required String id,
    required String time,
    required String status,
    bool completed = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.blueAccent,
            radius: 22,
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600)),
                Text("ID: $id",
                    style: TextStyle(color: Colors.grey.shade600)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 16),
                    const SizedBox(width: 4),
                    Text(time,
                        style: TextStyle(color: Colors.grey.shade600)),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
              color: completed
                  ? Colors.green.shade100
                  : Colors.blueAccent.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: completed ? Colors.green : Colors.blueAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
