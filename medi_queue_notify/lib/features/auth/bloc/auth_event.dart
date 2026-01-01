part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class LoginRequested extends AuthEvent {
  final String ph;
  final String password;

  LoginRequested({required this.ph, required this.password});
}

final class LogoutRequested extends AuthEvent{}
