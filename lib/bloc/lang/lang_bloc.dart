import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iamc_flutter/bloc/lang/lang_event.dart';
import 'package:iamc_flutter/bloc/lang/lang_state.dart';
import 'package:iamc_flutter/repos/lang_repos.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final LanguageRepos repository;

  LanguageBloc({required this.repository}) : super(LanguageInitial()) {
    on<ChangeLanguageEvent>((event, emit) async {
      emit(LanguageChanging());
      try {
        final language = await repository.changeLanguage(event.language);
        emit(LanguageChanged(language: language));
      } catch (e) {
        emit(LanguageChangeError(error: e.toString()));
      }
    });
  }
}
