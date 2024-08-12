part of 'all_news_bloc.dart';

@immutable
sealed class AllNewsEvent {}

class GetAllNewsEvent extends AllNewsEvent {}