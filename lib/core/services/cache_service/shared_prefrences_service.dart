import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrencesService {
  static SharedPreferences? _instance;

  static SharedPreferences getInstance() {
    return _instance!;
  }

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }
}
