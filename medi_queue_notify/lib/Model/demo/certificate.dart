class Certificate {
  final String name;
  final DateTime issueDate;
  final String status;

  Certificate({
    required this.name,
    required this.issueDate,
    required this.status,
  });

  /// Converts JSON from backend → Certificate object
  factory Certificate.fromJson(Map<String, dynamic> json) {
    return Certificate(
      name: json['name'] ?? '',
      issueDate: DateTime.parse(json['issue_date'] ?? json['issueDate']),
      status: json['status'] ?? '',
    );
  }

  /// Converts Certificate → JSON for API POST/PUT requests
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'issue_date': issueDate.toIso8601String(),
      'status': status,
    };
  }
}
