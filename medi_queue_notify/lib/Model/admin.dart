class Admin {
  final int? id;
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final int? tenantId;
  final String? password;

  Admin({
    this.id,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.tenantId,
    this.password,
  });

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      tenantId: json['tenantId'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'tenantId': tenantId,
      'password': password,
    };
  }
}  


