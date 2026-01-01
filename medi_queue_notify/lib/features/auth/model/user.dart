import 'package:medi_queue_notify/Model/enum/type.dart';
import 'package:medi_queue_notify/Model/enum/role.dart';
import 'package:medi_queue_notify/Model/enum/shift.dart';
import 'package:medi_queue_notify/Model/enum/specialist_area.dart';
import 'package:medi_queue_notify/Model/certification_summary.dart';

class User {
  final int? id;
  final String? fullName;
  final String? picture;
  final String? email;
  final String? phoneNumber;
  final String? password;
  final int? tenantId;
  final Type? type;
  final Role? role;
  final Shift? shift;
  final SpecialistArea? specialistArea;
  final List<CertificationSummary>? certificationSummarys;

  User({
    this.id,
    this.fullName,
    this.picture,
    this.email,
    this.phoneNumber,
    this.password,
    this.tenantId,
    this.type,
    this.role,
    this.shift,
    this.specialistArea,
    this.certificationSummarys,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullName: json['fullName'],
      picture: json['picture'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
      tenantId: json['tenantId'],
      type: json['type'] != null ? typeFromString(json['type']) : null,
      role: json['role'] != null ? roleFromString(json['role']) : null,
      shift: json['shift'] != null ? shiftFromString(json['shift']) : null,
      specialistArea: json['specialistArea'] != null
          ? specialistAreaFromString(json['specialistArea'])
          : null,
      certificationSummarys: json['certificationSummarys'] != null
          ? (json['certificationSummarys'] as List)
                .map((e) => CertificationSummary.fromJson(e))
                .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'picture': picture,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'tenantId': tenantId,
      'type': type != null ? typeToString(type!) : null,
      'role': role != null ? roleToString(role!) : null,
      'shift': shift != null ? shiftToString(shift!) : null,
      'specialistArea': specialistArea != null
          ? specialistAreaToString(specialistArea!)
          : null,
      'certificationSummarys': certificationSummarys
          ?.map((e) => e.toJson())
          .toList(),
    };
  }
}
