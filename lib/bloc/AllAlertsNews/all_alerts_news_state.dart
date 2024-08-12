part of 'all_alerts_news_bloc.dart';

@immutable
sealed class AllAlertsNewsState {}

final class AllAlertsNewsInitial extends AllAlertsNewsState {}

final class AllAlertsNewsLoading extends AllAlertsNewsState {}

final class AllAlertsNewsSuccess extends AllAlertsNewsState {
  final List<AlertsNewsModel> alertsNews;
  AllAlertsNewsSuccess({required this.alertsNews});
}

final class AllAlertsNewsError extends AllAlertsNewsState {
  final String errorText;

  AllAlertsNewsError({required this.errorText});
}