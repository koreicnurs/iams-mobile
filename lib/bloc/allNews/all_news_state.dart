part of 'all_news_bloc.dart';

@immutable
sealed class AllNewsState {}

final class AllNewsInitial extends AllNewsState {}

final class AllNewsLoading extends AllNewsState {}

final class AllNewsSuccess extends AllNewsState {
  final List<NewsModel> allNewsModel;
  AllNewsSuccess({required this.allNewsModel});
}

final class AllNewsError extends AllNewsState {
  final String errorText;

  AllNewsError({required this.errorText});
}