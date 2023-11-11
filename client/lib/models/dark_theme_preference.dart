import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
  static const DARK_THEME_STATUS = "DARK_THEME_STATUS";

  setDarkTheme(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(DARK_THEME_STATUS, value);
  }

  Future<bool> getDarkTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(DARK_THEME_STATUS) ?? false;
  }
}
