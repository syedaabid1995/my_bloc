import 'package:shared_preferences/shared_preferences.dart';

/// Constants for SharedPreferences
class SharedPrefKeys {
  SharedPrefKeys._();

  static const String languageCode = 'languageCode';
  static const String SelectedTheme = 'selectedTheme';

}

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static SharedPreferences? _preferences;

  SharedPreferencesService._internal();

  static Future<SharedPreferencesService?> get instance async {
    if (_instance == null) {
      _instance = SharedPreferencesService._internal();
    }

    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }

    return _instance;
  }

  Future<void> setLanguage(String langCode) async =>
      await _preferences?.setString(SharedPrefKeys.languageCode, langCode);

  String? get languageCode =>
      _preferences!.getString(SharedPrefKeys.languageCode);

  Future<void> setTheme(int themeId) async =>
      await _preferences?.setInt(SharedPrefKeys.SelectedTheme, themeId);

  int? get themeId => _preferences!.getInt(SharedPrefKeys.SelectedTheme);
}
