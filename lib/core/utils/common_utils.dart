import 'dart:convert';

import 'package:flutter/material.dart';

import '../../imports.dart';

class CommonUtils {
  static Future<DateTime?> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.deepPurple,
            colorScheme: const ColorScheme.light(primary: Colors.deepPurple),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      return picked;
    }
    return null;
  }

  static Future<void> saveAdminUsernameAndPassword(
    String username,
    String password,
  ) async {
    final secureStorage = SecureStorageService.getInstance();

    AdminAccountList adminAccountList = await getAdminAccountList();

    final EmailPasswordModel adminModel =
        EmailPasswordModel(email: username, password: password);

    secureStorage.setString(
      SecureStorageKeys.chosenAdminKey,
      adminModel.toJson().toString(),
    );
    Constants.chosenAdmin = adminModel;

    final EmailPasswordModel existingAccount =
        adminAccountList.accounts.firstWhere(
      (account) => account.email == username,
      orElse: () => EmailPasswordModel(email: '', password: ''),
    );

    if (existingAccount.email.isNotEmpty) {
      existingAccount.password = password;
      // save the updated account back to the list
      adminAccountList.accounts
          .removeWhere((account) => account.email == username);
      adminAccountList.accounts.add(existingAccount);
      await secureStorage.setString(
        SecureStorageKeys.adminAccountsList,
        adminAccountList.toJson().toString(),
      );
      return;
    }

    adminAccountList.accounts.add(adminModel);

    await secureStorage.setString(
      SecureStorageKeys.adminAccountsList,
      adminAccountList.toJson().toString(),
    );
  }

  static Future<AdminAccountList> getAdminAccountList() async {
    String jsonString = SecureStorageService.getInstance()
            .getString(SecureStorageKeys.adminAccountsList) ??
        "";

    if (jsonString.isNotEmpty) {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);

      return AdminAccountList.fromJson(jsonMap);
    }
    return AdminAccountList(accounts: []);
  }

  static Future<EmailPasswordModel> getChosenAdminOrUser(String key) async {
    String jsonString =
        await SecureStorageService.getInstance().getString(key) ?? "";

    if (jsonString.isNotEmpty) {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return EmailPasswordModel.fromJson(jsonMap);
    }
    return EmailPasswordModel(email: "", password: "");
  }
}
