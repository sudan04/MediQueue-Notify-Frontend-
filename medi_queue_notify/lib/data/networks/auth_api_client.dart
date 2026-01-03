import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthApiClient {
  final String baseUrl;
  final http.Client _client;

  AuthApiClient({
    required this.baseUrl,
    http.Client? client,
  }) : _client = client ?? http.Client();

  Future<Map<String, dynamic>> login({
    required String phone,
    required String password,
    required String type,
  }) async {

    final url = Uri.parse(
      '$baseUrl/$type',
    );

    final response = await _client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'phoneNumber': phone,
        'password': password,
      }),
    );

    _handleError(response);
    return jsonDecode(response.body) as Map<String, dynamic>;
  }


  void _handleError(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception(
        'Auth error ${response.statusCode}: ${response.body}',
      );
    }
  }
}
