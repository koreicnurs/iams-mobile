part of 'guides_bloc.dart';

@immutable
sealed class GuidesState {}

final class GuidesInitial extends GuidesState {}

final class GuidesLoading extends GuidesInitial {}

final class GuidesSuccess extends GuidesInitial {
  final List<GuidesModel> guides;
  GuidesSuccess({required this.guides});
}

final class GuidesError extends GuidesInitial {
  final String errorText;

  GuidesError({required this.errorText});
}