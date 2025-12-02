import 'home.dart';
import 'enum/role.dart';
import 'enum/type.dart';

class UserList {
  final int? id;
  final String? fullName;
  final String? email;
  final String? picture;
  final String? phoneNumber;
  final String? password;
  final int? tenantId;
  final Type? type;
  final Role? role;
  final Home? currentHome;
  final List<Home>? homes;

  UserList({
    this.id,
    this.fullName,
    this.email,
    this.picture,
    this.phoneNumber,
    this.password,
    this.tenantId,
    this.type,
    this.role,
    this.currentHome,
    this.homes,
  });

  factory UserList.fromJson(Map<String, dynamic> json) {
    return UserList(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      picture: json['picture'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
      tenantId: json['tenantId'],
      type: json['type'] != null ? typeFromString(json['type']) : null,
      role: json['role'] != null ? roleFromString(json['role']) : null,
      currentHome: json['currentHome'] != null
          ? Home.fromJson(json['currentHome'])
          : null,
      homes: json['homes'] != null
          ? (json['homes'] as List).map((e) => Home.fromJson(e)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'picture': picture,
      'phoneNumber': phoneNumber,
      'password': password,
      'tenantId': tenantId,
      'type': type != null ? typeToString(type!) : null,
      'role': role != null ? roleToString(role!) : null,
      'currentHome': currentHome?.toJson(),
      'homes': homes?.map((e) => e.toJson()).toList(),
    };
  }
}
