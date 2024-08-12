import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iamc_flutter/models/news_model.dart';
import 'package:iamc_flutter/repos/news_repos.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepos repository;

  NewsBloc({required this.repository}) : super(NewsInitial()) {
    on<GetNewsEvent>((event, emit) async {
      emit(NewsLoading());
      try {
        final newsResponse = await repository.getNewsRequest();
        emit(NewsSuccess(newsModel: newsResponse.newsList));
      } catch (e) {
        emit(NewsError(errorText: e.toString()));
      }
    });
  }
}