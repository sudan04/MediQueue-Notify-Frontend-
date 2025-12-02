import 'package:medi_queue_notify/Model/admin.dart';

class Tenant {
  final int? id;
  final String? name;
  final String? email;
  final String? website;
  final String? tenantLogo;
  final Admin? admin;

  Tenant({
    this.id,
    this.name,
    this.email,
    this.website,
    this.tenantLogo,
    this.admin,
  });

  factory Tenant.fromJson(Map<String, dynamic> json) {
    return Tenant(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      website: json['website'],
      tenantLogo: json['tenantLogo'],
      admin: json['admin'] != null ? Admin.fromJson(json['admin']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'website': website,
      'tenantLogo': tenantLogo,
      'admin': admin?.toJson(),
    };
  }
}
