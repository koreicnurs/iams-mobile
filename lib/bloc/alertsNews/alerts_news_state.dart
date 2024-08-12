part of 'alerts_news_bloc.dart';

@immutable
sealed class AlertsNewsState {}

final class AlertsNewsInitial extends AlertsNewsState {}

final class AlertsNewsLoading extends AlertsNewsState {}

final class AlertsNewsSuccess extends AlertsNewsState {
  final List<AlertsNewsModel> alertsNewsModel;
  AlertsNewsSuccess({required this.alertsNewsModel});
}

final class AlertsNewsError extends AlertsNewsState {
  final String errorText;
  AlertsNewsError({required this.errorText});
}
