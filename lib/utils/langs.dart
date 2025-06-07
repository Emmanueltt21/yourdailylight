enum AppLanguage { English, French, German }

/// Returns enum value name without enum class name.
String enumName(AppLanguage anyEnum) {
  return anyEnum.toString().split('.')[1];
}

final appLanguageData = {
  AppLanguage.English: {"value": "en", "name": "English"},
  AppLanguage.French: {"value": "fr", "name": "French"},
  AppLanguage.German: {"value": "de", "name": "German"},
};
