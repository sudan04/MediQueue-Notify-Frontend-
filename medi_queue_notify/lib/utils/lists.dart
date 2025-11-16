import 'package:medi_queue_notify/Model/medical_note.dart';
import 'package:medi_queue_notify/Model/medicine.dart';
import 'package:medi_queue_notify/Model/patient.dart';
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
      status: 'Completed',
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
      status: 'Overdue',
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
      status: 'Pending',
      endTime: null,
      repeatHour: null,
      repeatMinute: null,
    ),
  ];

  static final List<Patient> patientList = [
    Patient(
      id: "P001",
      name: "John Doe",
      type: "Outpatient",
      admissionDate: "2025-05-28",
      status: "Admitted",
    ),
    Patient(
      id: "P001",
      name: "Machiel Johnson",
      type: "Inpatient",
      admissionDate: "2024-05-13",
      status: "Pending",
    ),
    Patient(
      id: "P001",
      name: "David",
      type: "Inpatient",
      admissionDate: "2022-12-14",
      status: "Discharged",
    ),
    Patient(
      id: "P001",
      name: "Mohamed Johnson",
      type: "Inpatient",
      admissionDate: "2024-12-02",
      status: "Pending",
    ),
    Patient(
      id: "P001",
      name: "John Doe", 
      type: "Outpatient",
      admissionDate: "2025-05-28",
      status: "Admitted",
    ),
    
  ];

  static List<Medicine> medicines = [
    Medicine(name: "Amoxicillin", schedule: "1 capsule - Morning & Evening"),
    Medicine(name: "Omeprazole", schedule: "Before Breakfast"),
    Medicine(name: "Vitamin D3", schedule: "Once a week"),
  ];

  static final List<MedicalNote> medicalNotes = [
    MedicalNote(
      id: 'N001',
      title: "Post-op Follow-up - Day 3",
      description:
          "Patient reported moderate pain (4/10) at incision site, stable vital signs. Dressing changed, no signs of infection.",
      dateTime: "2024-07-28 10:30 AM",
    ),
    MedicalNote(
      id: 'N002',
      title: "Initial Assessment - Patient A. S.",
      description:
          "Patient presented with flu-like symptoms including fever (101°F), cough, and body aches. No difficulty breathing.",
      dateTime: "2024-07-27 02:15 PM",
    ),
    MedicalNote(
      id: 'N003',
      title: "Diabetic Foot Exam",
      description:
          "Comprehensive diabetic foot exam performed. No new ulcers or lesions noted. Peripheral pulses palpable.",
      dateTime: "2024-07-26 11:00 AM",
    ),
    MedicalNote(
      id: 'N004',
      title: "Blood Pressure Check",
      description:
          "Routine checkup. BP recorded at 118/76 mmHg. Patient advised to continue current medication and exercise plan.",
      dateTime: "2024-07-25 09:45 AM",
    ),
    MedicalNote(
      id: 'N005',
      title: "Follow-up Consultation",
      description:
          "Patient reports improved appetite and reduced fatigue. Labs reviewed — all within normal limits.",
      dateTime: "2024-07-24 04:30 PM",
    ),
  ];
}
