import 'package:medi_queue_notify/Model/enum/role.dart';
import 'package:medi_queue_notify/Model/enum/type.dart';

class CurrentUser {
  final int? id;
  final String? fullName;
  final String? picture;
  final String? phoneNumber;
  final int? tenantId;
  final List<int>? homesIds;
  final Type? type;
  final Role? role;
  final int? currentHomeId;

  CurrentUser({
    this.id,
    this.fullName,
    this.picture,
    this.phoneNumber,
    this.tenantId,
    this.homesIds,
    this.type,
    this.role,
    this.currentHomeId,
  });

  factory CurrentUser.fromJson(Map<String, dynamic> json) {
    return CurrentUser(
      id: json['id'],
      fullName: json['fullName'],
      picture: json['picture'],
      phoneNumber: json['phoneNumber'],
      tenantId: json['tenantId'],
      homesIds: json['homesIds'] != null
          ? List<int>.from(json['homesIds'])
          : null,
      type: json['type'] != null ? typeFromString(json['type']) : null,
      role: json['role'] != null ? roleFromString(json['role']) : null,
      currentHomeId: json['currentHomeId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'picture': picture,
      'phoneNumber': phoneNumber,
      'tenantId': tenantId,
      'homesIds': homesIds,
      'type': type != null ? typeToString(type!) : null,
      'role': role != null ? roleToString(role!) : null,
      'currentHomeId': currentHomeId,
    };
  }
}
