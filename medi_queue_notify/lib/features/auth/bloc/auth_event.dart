part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class LoginRequested extends AuthEvent {
  final String ph;
  final String password;
  final String type;

  LoginRequested({
    required this.ph,
    required this.password,
    required this.type,
  });
}

final class LogoutRequested extends AuthEvent {}

