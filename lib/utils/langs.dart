enum AppLanguage {
  English,
  French,
  German,
  Italian,
  Spanish,
  Hindi,
  Russian,
  Portuguese,
  Mandarin,
}

/// Returns enum value name without enum class name.
String enumName(AppLanguage anyEnum) {
  return anyEnum.toString().split('.')[1];
}

final appLanguageData = {
  AppLanguage.English:    {"value": "en", "name": "English",    "flag": "🇬🇧"},
  AppLanguage.French:     {"value": "fr", "name": "French",     "flag": "🇫🇷"},
  AppLanguage.German:     {"value": "de", "name": "German",     "flag": "🇩🇪"},
  AppLanguage.Italian:    {"value": "it", "name": "Italian",    "flag": "🇮🇹"},
  AppLanguage.Spanish:    {"value": "es", "name": "Spanish",    "flag": "🇪🇸"},
  AppLanguage.Hindi:      {"value": "hi", "name": "Hindi",      "flag": "🇮🇳"},
  AppLanguage.Russian:    {"value": "ru", "name": "Russian",    "flag": "🇷🇺"},
  AppLanguage.Portuguese: {"value": "pt", "name": "Portuguese", "flag": "🇧🇷"},
  AppLanguage.Mandarin:   {"value": "zh", "name": "Mandarin",   "flag": "🇨🇳"},
};
