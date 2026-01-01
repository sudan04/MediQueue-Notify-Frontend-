import 'package:flutter/material.dart';

class TaskValidator {
  // Validate resident (object)
  static String? validateResident(dynamic resident) {
    if (resident == null) return "Please select a resident";
    return null;
  }

  // Validate role (string)
  static String? validateRole(String? role) {
    if (role == null || role.isEmpty) return "Please select a role";
    return null;
  }

  // Validate priority (string)
  static String? validatePriority(String? priority) {
    if (priority == null || priority.isEmpty) return "Please select priority";
    return null;
  }

  // Validate title (string)
  static String? validateTitle(String? title) {
    if (title == null || title.trim().isEmpty) return "Please enter task title";
    return null;
  }

  // Validate description (string)
  static String? validateDescription(String? desc) {
    if (desc == null || desc.trim().isEmpty) return "Please enter task description";
    return null;
  }

  // Validate start date
  static String? validateStartDate(DateTime? startDate) {
    if (startDate == null) return "Please select start date";
    return null;
  }

  // Validate end date
  static String? validateEndDate(DateTime? startDate, DateTime? endDate) {
    if (endDate == null) return "Please select end date";
    if (startDate != null && endDate.isBefore(startDate)) return "End date cannot be before start date";
    return null;
  }

  // Validate start time
  static String? validateStartTime(TimeOfDay? startTime) {
    if (startTime == null) return "Please select start time";
    return null;
  }

  // Validate end time (if occurrence > once)
  static String? validateEndTime(String? occ, TimeOfDay? endTime) {
    if (occ != null && occ != "Once" && endTime == null) {
      return "Please select end time";
    }
    return null;
  }

  // Validate repeat interval (hours/minutes)
  static String? validateRepeatInterval(String? occ, String? hourText, String? minText) {
    if (occ != null && occ != "Once") {
      int? hour = int.tryParse(hourText ?? "");
      int? min = int.tryParse(minText ?? "");
      if ((hour == null && min == null) || (hour == 0 && min == 0)) {
        return "Please enter repeat interval";
      }
    }
    return null;
  }
}
