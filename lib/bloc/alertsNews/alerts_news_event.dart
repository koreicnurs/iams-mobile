part of 'alerts_news_bloc.dart';

@immutable
sealed class AlertsNewsEvent {}

class GetAlertsNewsEvent extends AlertsNewsEvent {}