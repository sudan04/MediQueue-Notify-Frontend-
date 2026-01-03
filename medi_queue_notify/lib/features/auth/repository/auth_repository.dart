import 'package:medi_queue_notify/data/token_storage.dart';
import 'package:medi_queue_notify/features/auth/model/auth_response.dart';

import '../../../data/datasource/auth_remote_datasource.dart';

class AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final TokenStorage storage;

  AuthRepository({required this.remoteDataSource, required this.storage});

  Future<AuthResponse> login({
    required String phone,
    required String password,
    required String type,
  }) async {
    final response = await remoteDataSource.login(phone, password, type);

    if (response.containsKey("jwt")) {
      storage.saveToken(response["jwt"]);
    }
    return AuthResponse.fromJson(response);
  }
}
