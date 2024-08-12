import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iamc_flutter/models/alerts_news_model.dart';
import 'package:iamc_flutter/repos/alerts_news_repos.dart';

part 'alerts_news_event.dart';
part 'alerts_news_state.dart';

class AlertsNewsBloc extends Bloc<AlertsNewsEvent, AlertsNewsState> {
  AlertsNewsBloc({required this.repository}) : super(AlertsNewsInitial()) {
    on<GetAlertsNewsEvent>((event, emit) async {
      try {
        emit(AlertsNewsLoading());

        final model = await repository.getAlertsNewsRequest();

        emit(AlertsNewsSuccess(alertsNewsModel: model.alertsNewsList));
      } catch (e) {
        emit(AlertsNewsError(errorText: e.toString()));
      }
    });
  }
  final AlertsNewsRepos repository;
}
