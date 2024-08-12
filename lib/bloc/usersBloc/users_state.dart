part of 'users_bloc.dart';

@immutable
sealed class UsersState {}

final class UsersInitial extends UsersState {}

final class UsersLoading extends UsersState {}

final class UsersSuccess extends UsersState {
  final UserGetMe getMeModel;
  UsersSuccess({required this.getMeModel});
}

final class UsersError extends UsersState {
  final String errorText;

  UsersError({required this.errorText});
}
