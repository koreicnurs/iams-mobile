import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iamc_flutter/models/about_model.dart';
import 'package:iamc_flutter/repos/about_repos.dart';

part 'about_bloc_event.dart';
part 'about_bloc_state.dart';

class AboutBloc extends Bloc<AboutBlocEvent, AboutBlocState> {
  final AboutRepos repository;

  AboutBloc({required this.repository}) : super(AboutInitial()) {
    on<GetAboutEvent>((event, emit) async {
      emit(AboutLoading());
      try {
        final res = await repository.getAboutRequest();
        emit(AboutSuccess(about: res));
      } catch (e) {
        emit(AboutError(errorText: e.toString()));
      }
    });
  }
}
