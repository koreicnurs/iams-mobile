part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthToken extends AuthEvent {
  final String number;
  AuthToken({required this.number});
}
