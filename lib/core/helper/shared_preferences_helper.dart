import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedPreferencesHelper {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  static Future<String?> _safeRead(String key) async {
    try {
      return await _storage.read(key: key);
    } on PlatformException catch (e) {
      if (e.message?.contains('BadPaddingException') == true ||
          e.message?.contains('BAD_DECRYPT') == true ||
          e.code == 'BadPaddingException') {
        await clearAll();
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  static Future<void> _safeWrite(String key, String value) async {
    try {
      await _storage.write(key: key, value: value);
    } catch (_) {
      try {
        await clearAll();
        await _storage.write(key: key, value: value);
      } catch (_) {}
    }
  }

  static Future<void> setInt(String key, int value) async {
    await _safeWrite(key, value.toString());
  }

  static Future<void> setString(String key, String value) async {
    await _safeWrite(key, value);
  }

  static Future<void> setDouble(String key, double value) async {
    await _safeWrite(key, value.toString());
  }

  static Future<void> setBoolean(String key, bool value) async {
    await _safeWrite(key, value.toString());
  }

  static Future<int?> getInt(String key) async {
    final value = await _safeRead(key);
    return value != null ? int.tryParse(value) : null;
  }

  static Future<String?> getString(String key) async {
    return await _safeRead(key);
  }

  static Future<double?> getDouble(String key) async {
    final value = await _safeRead(key);
    return value != null ? double.tryParse(value) : null;
  }

  static Future<bool?> getBoolean(String key) async {
    final value = await _safeRead(key);
    return value != null ? value == 'true' : null;
  }

  static Future<void> clearAll() async {
    try {
      await _storage.deleteAll();
    } catch (_) {}
  }

  static Future<void> remove(String key) async {
    try {
      await _storage.delete(key: key);
    } catch (_) {}
  }
}
