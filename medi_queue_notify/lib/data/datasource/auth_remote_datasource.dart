import 'package:medi_queue_notify/data/networks/auth_api_client.dart';

class AuthRemoteDataSource {
  final AuthApiClient apiClient;

  AuthRemoteDataSource(this.apiClient);

  Future<Map<String, dynamic>> login(
    String phone,
    String password,
    String type,
  ) {
    return apiClient.login(phone: phone, password: password, type: type);
  }
}
