import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  // SET
  Future<bool> setString(String key, String value) async {
    SharedPreferences local = await SharedPreferences.getInstance();
    return local.setString(key, value);
  }

  Future<bool> setInt(String key, int value) async {
    SharedPreferences local = await SharedPreferences.getInstance();
    return local.setInt(key, value);
  }

  Future<bool> setDouble(String key, double value) async {
    SharedPreferences local = await SharedPreferences.getInstance();
    return local.setDouble(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    SharedPreferences local = await SharedPreferences.getInstance();
    return local.setBool(key, value);
  }

  // GET
  Future<String?> getString(String key) async {
    SharedPreferences local = await SharedPreferences.getInstance();
    return local.getString(key);
  }

  Future<int?> getInt(String key) async {
    SharedPreferences local = await SharedPreferences.getInstance();
    return local.getInt(key);
  }

  Future<double?> getDouble(String key) async {
    SharedPreferences local = await SharedPreferences.getInstance();
    return local.getDouble(key);
  }

  Future<bool?> getBool(String key) async {
    SharedPreferences local = await SharedPreferences.getInstance();
    return local.getBool(key);
  }

  Future<bool> remove(String key) async {
    SharedPreferences local = await SharedPreferences.getInstance();
    return local.remove(key);
  }
}
