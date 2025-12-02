import 'package:medi_queue_notify/Model/enum/certificate_status.dart';

class CertificationSummary {
  final int? id;
  final String? name;
  final CertificateStatus? status;
  final DateTime? issueDate;
  final DateTime? expiryDate;

  CertificationSummary({
    this.id,
    this.name,
    this.status,
    this.issueDate,
    this.expiryDate,
  });

  factory CertificationSummary.fromJson(Map<String, dynamic> json) {
    return CertificationSummary(
      id: json['id'],
      name: json['name'],
      status: json['status'] != null
          ? certificateStatusFromString(json['status'])
          : null,
      issueDate:
          json['issueDate'] != null ? DateTime.parse(json['issueDate']) : null,
      expiryDate:
          json['expiryDate'] != null ? DateTime.parse(json['expiryDate']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status != null ? certificateStatusToString(status!) : null,
      'issueDate': issueDate?.toIso8601String().split('T').first,
      'expiryDate': expiryDate?.toIso8601String().split('T').first,
    };
  }
}
