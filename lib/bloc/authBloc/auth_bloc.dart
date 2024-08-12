import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iamc_flutter/repos/auth_repos.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<AuthToken>((event, emit) async {
      emit(AuthLoading());
      try {
        await repository.sendPostRequest(number: event.number);
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthError(errorText: e.toString()));
      }
    });
  }
  final AuthRepos repository;
}
