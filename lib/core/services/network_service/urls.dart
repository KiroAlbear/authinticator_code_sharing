import 'package:flutter/foundation.dart';

class Urls {
  Urls._();

  // static const String baseUrl = "http://localhost:8000";

  static const String baseUrl = kDebugMode
      ? "http://localhost:8000"
      : "https://chatgpt-fastapi-391j.onrender.com";

  static String get requestUserCode {
    return '$baseUrl/requestUserCode';
  }

  static String get loginUserAdmin {
    return '$baseUrl/getUserOrAdminData';
  }

  static String get getAllAdminUsers {
    return '$baseUrl/getAllAdminUsers';
  }

  static String get enableDisableUser {
    return '$baseUrl/enableDisableUser';
  }

  static String get enableDisableAllAdminUsers {
    return '$baseUrl/enableDisableAllAdminUsers';
  }

  static String get resetUser {
    return '$baseUrl/resetUser';
  }

  static String get deleteUser {
    return '$baseUrl/deleteUser';
  }

  static String get updateAdmin {
    return '$baseUrl/updateAdmin';
  }

  static String get getAdminProfileData {
    return '$baseUrl/getAdminProfileData';
  }

  static String get registerUser {
    return '$baseUrl/registerUser';
  }

  static String get addNewAdmin {
    return '$baseUrl/addNewAdmin';
  }
}
