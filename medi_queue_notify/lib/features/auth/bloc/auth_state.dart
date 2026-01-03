part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccess extends AuthState {
  final AuthResponse response;

  AuthSuccess({required this.response});
}

final class AuthFailure extends AuthState {
  final String errMsg;

  AuthFailure(this.errMsg);
}

final class AuthLoading extends AuthState {}
