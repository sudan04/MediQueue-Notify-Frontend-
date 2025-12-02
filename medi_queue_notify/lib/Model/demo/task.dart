import 'package:medi_queue_notify/Model/demo/staff.dart';

class TaskModel {
  int? id; // optional - useful when saving to backend
  String title;
  String description;
  Staff? resident; // assigned resident
  String? priority;
  String? role; // assigned staff role
  String? repeatFrequency; // e.g. "Everyday"
  String? occurrencePerDay; // e.g. "Once", "More than once"
  DateTime? startDate;
  DateTime? endDate;
  String? startTime; // store as string like "08:00"
  String? endTime; // store as string like "18:00"
  int? repeatHour;
  int? repeatMinute;
  String? status;

  TaskModel({
    this.id,
    required this.title,
    required this.description,
    this.resident,
    this.priority,
    this.role,
    this.repeatFrequency,
    this.occurrencePerDay,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.repeatHour,
    this.repeatMinute,
    this.status,
  });

  /// Convert model to JSON for backend API
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'resident': resident,
      'priority': priority,
      'role': role,
      'repeatFrequency': repeatFrequency,
      'occurrencePerDay': occurrencePerDay,
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'startTime': startTime,
      'endTime': endTime,
      'repeatHour': repeatHour,
      'repeatMinute': repeatMinute,
      'status': status,
    };
  }

  /// ✅ Create model from JSON (e.g. from backend response)
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      resident: json['resident'],
      priority: json['priority'],
      role: json['role'],
      repeatFrequency: json['repeatFrequency'],
      occurrencePerDay: json['occurrencePerDay'],
      startDate: json['startDate'] != null
          ? DateTime.parse(json['startDate'])
          : null,
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
      startTime: json['startTime'],
      endTime: json['endTime'],
      repeatHour: json['repeatHour'],
      repeatMinute: json['repeatMinute'],
      status: json['status'],
    );
  }
}
