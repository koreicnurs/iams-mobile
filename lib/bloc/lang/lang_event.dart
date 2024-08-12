abstract class LanguageEvent {}

class ChangeLanguageEvent extends LanguageEvent {
  final String language;

  ChangeLanguageEvent({required this.language});
}
