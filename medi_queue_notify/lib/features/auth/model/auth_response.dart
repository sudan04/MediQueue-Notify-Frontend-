class AuthResponse {
  final int id;
  final String fullName;
  final String jwt;
  final String picture;
  final String message;

  AuthResponse({
    required this.id,
    required this.fullName,
    required this.jwt,
    required this.picture,
    required this.message,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      id: json['id'],
      fullName: json['fullName'],
      jwt: json['jwt'],
      picture: json['picture'],
      message: json['message'],
    );
  }
}
