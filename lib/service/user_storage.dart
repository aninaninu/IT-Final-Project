
import 'package:shared_preferences/shared_preferences.dart';

class UserStorage {
  static final SharedPreferencesAsync _prefs =
      SharedPreferencesAsync();

  static Future<void> saveUsername(String name) async {
    await _prefs.setString('username', name);
  }

  static Future<String> getUsername() async {
    return await _prefs.getString('username') ?? 'Summer';
  }

  static Future<void> saveBio(String bio) async {
    await _prefs.setString('bio', bio);
  }

  static Future<String> getBio() async {
    return await _prefs.getString('bio') ??
        'Exploring the world, one quest at a time ✨';
  }

  static Future<void> saveXP(int xp) async {
    await _prefs.setInt('xp', xp);
  }

  static Future<int> getXP() async {
    return await _prefs.getInt('xp') ?? 0;
  }
}
