import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iamc_flutter/models/user_get_me_model.dart';
import 'package:iamc_flutter/repos/user_get_me_repos.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc({required this.repository}) : super(UsersInitial()) {
    on<GetUsersEvent>((event, emit) async {
      try {
        emit(UsersLoading());

        final model = await repository.getMeRequest();

        emit(
          UsersSuccess(getMeModel: model),
        );
      } catch (e) {
        emit(UsersError(errorText: e.toString()));
      }
    });
  }
  final UserGetMeRepos repository;
}
