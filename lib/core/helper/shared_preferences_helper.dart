import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedPreferencesHelper {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
    ),
  );

  static Future<void> setInt(String key, int value) async {
    await _storage.write(key: key, value: value.toString());
  }

  static Future<void> setString(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  static Future<void> setDouble(String key, double value) async {
    await _storage.write(key: key, value: value.toString());
  }

  static Future<void> setBoolean(String key, bool value) async {
    await _storage.write(key: key, value: value.toString());
  }

  static Future<int?> getInt(String key) async {
    String? value = await _storage.read(key: key);
    return value != null ? int.tryParse(value) : null;
  }

  static Future<String?> getString(String key) async {
    return await _storage.read(key: key);
  }

  static Future<double?> getDouble(String key) async {
    String? value = await _storage.read(key: key);
    return value != null ? double.tryParse(value) : null;
  }

  static Future<bool?> getBoolean(String key) async {
    String? value = await _storage.read(key: key);
    return value != null ? value == 'true' : null;
  }

  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }

  static Future<void> remove(String key) async {
    await _storage.delete(key: key);
  }
}
