import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iamc_flutter/models/alerts_news_model.dart';
import 'package:iamc_flutter/repos/alerts_news_repos.dart';

part 'all_alerts_news_event.dart';
part 'all_alerts_news_state.dart';

class AllAlertsNewsBloc extends Bloc<AllAlertsNewsEvent, AllAlertsNewsState> {
    final AlertsNewsRepos repository;

  AllAlertsNewsBloc({required this.repository}) : super(AllAlertsNewsInitial()) {
    on<GetAllAlertsNewsEvent>((event, emit) async {
      emit(AllAlertsNewsLoading());
      try {
        final response = await repository.getAlertsNewsByQuery({"perPage": 5});
        emit(AllAlertsNewsSuccess(alertsNews: response.alertsNewsList));
      } catch (e) {
        emit(AllAlertsNewsError(errorText: e.toString()));
      }
    });
  }
}
