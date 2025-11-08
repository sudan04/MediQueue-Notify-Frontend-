 import 'package:medi_queue_notify/Model/staff.dart';
import 'package:medi_queue_notify/Model/task.dart';

 class Lists {
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



  static List<TaskModel> taskList = [

  TaskModel(
    id: 1,
    title: "Morning Rounds",
    description: "Doctor visits all patients for morning health checks.",
    resident: allStaff[0],
    priority: "High Priority",
    role: "Doctor",
    repeatFrequency: "Everyday",
    occurrencePerDay: "Once",
    startDate: DateTime(2025, 11, 8),
    endDate: DateTime(2025, 11, 30),
    startTime: "08:00",
    endTime: null,      
    repeatHour: null,    
    repeatMinute: null,  
  ),

  TaskModel(
    id: 2,
    title: "Medicine Distribution",
    description: "Nurses distribute prescribed medicines to all patients.",
    resident: allStaff[1],
    priority: "Medium Priority",
    role: "Nurse",
    repeatFrequency: "Everyday",
    occurrencePerDay: "More than once",
    startDate: DateTime(2025, 11, 8),
    endDate: DateTime(2025, 11, 15),
    startTime: "09:30",
    endTime: "17:00",    
    repeatHour: 3,       
    repeatMinute: 0,
  ),

  
  TaskModel(
    id: 3,
    title: "Room Sanitization",
    description: "Supporting staff clean and sanitize patient rooms.",
    resident: allStaff[2],
    priority: "Low Priority",
    role: "Supporting Staff",
    repeatFrequency: "Every Weekday",
    occurrencePerDay: "Once",
    startDate: DateTime(2025, 11, 9),
    endDate: DateTime(2025, 12, 9),
    startTime: "10:00",
    endTime: null,
    repeatHour: null,
    repeatMinute: null,
  ),
];
 }
