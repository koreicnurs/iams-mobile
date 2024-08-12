part of 'about_bloc_bloc.dart';

@immutable
sealed class AboutBlocState {}

final class AboutInitial extends AboutBlocState {}

final class AboutLoading extends AboutBlocState {}

final class AboutSuccess extends AboutBlocState {
  final AboutModel about;
  AboutSuccess({required this.about});
}

final class AboutError extends AboutBlocState {
  final String errorText;

  AboutError({required this.errorText});
}