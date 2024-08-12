import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iamc_flutter/models/news_model.dart';
import 'package:iamc_flutter/repos/news_repos.dart';

part 'all_news_event.dart';
part 'all_news_state.dart';

class AllNewsBloc extends Bloc<AllNewsEvent, AllNewsState> {
  final NewsRepos repository;

  AllNewsBloc({required this.repository}) : super(AllNewsInitial()) {
    on<AllNewsEvent>((event, emit) async {
      emit(AllNewsLoading());
      try {
        final newsResponse = await repository.getNewsByQuery({"perPage": 5});
        emit(AllNewsSuccess(allNewsModel: newsResponse.newsList));
      } catch (e) {
        emit(AllNewsError(errorText: e.toString()));
      }
    });
  }
}
