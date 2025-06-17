import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecureStorageService {
  static SharedPreferences? _instance;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static SharedPreferences getInstance() {
    return _instance!;
  }

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  Future<void> clear() async {
    await _storage.deleteAll();
  }

  Future<void> setValue(String key, String? value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String> getValue(String key) async {
    return await _storage.read(key: key) ?? "";
  }

  Future<void> setJsonObject(String key, Map<String, dynamic> value) async {
    String jsonString = value.toString(); // Convert to JSON string
    await _storage.write(key: key, value: jsonString);
  }

  Future<void> deleteValue(String key) async {
    return await _storage.delete(key: key);
  }
}
