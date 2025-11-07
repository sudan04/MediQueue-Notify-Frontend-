 import 'package:medi_queue_notify/Model/staff.dart';

 class StaffList {
  static List<Staff> allStaff = [
    Staff(
      name: "Dr. Emily Turner",
      role: "Doctor",
      shift: "Morning Shift: 8 AM - 4 PM",
      status: "On Duty",
      imageUrl: "https://i.pravatar.cc/150?img=1",
    ),
    Staff(
      name: "Dr. Michael Brown",
      role: "Doctor",
      shift: "Vacation",
      status: "On Leave",
      imageUrl: "https://i.pravatar.cc/150?img=2",
    ),
    Staff(
      name: "Nurse Alice",
      role: "Nurse",
      shift: "Day Shift: 9 AM - 5 PM",
      status: "On Duty",
      imageUrl: "https://i.pravatar.cc/150?img=3",
    ),
  ];
 }
