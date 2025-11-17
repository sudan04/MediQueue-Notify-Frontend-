import 'package:medi_queue_notify/Model/staff.dart';

class Tenant {
  final String name;
  final int phone;
  final Staff admin;
  final String logoUrl;

  Tenant({
    required this.name,
    required this.phone,
    required this.admin,
    required this.logoUrl,
  });
}
