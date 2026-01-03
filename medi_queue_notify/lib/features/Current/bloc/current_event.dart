part of 'current_bloc.dart';

@immutable
sealed class CurrentEvent {}

class GetCurrentRequested extends CurrentEvent {}
