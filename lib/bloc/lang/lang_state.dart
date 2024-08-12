abstract class LanguageState {}

class LanguageInitial extends LanguageState {}

class LanguageChanging extends LanguageState {}

class LanguageChanged extends LanguageState {
  final String language;

  LanguageChanged({required this.language});
}

class LanguageChangeError extends LanguageState {
  final String error;

  LanguageChangeError({required this.error});
}
