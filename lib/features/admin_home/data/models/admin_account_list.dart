import '../../../../imports.dart';

class AdminAccountList {
  List<EmailPasswordModel> accounts;

  AdminAccountList({required this.accounts});

  factory AdminAccountList.fromJson(Map<String, dynamic> json) {
    var accountsJson = json["accounts"] as List;
    List<EmailPasswordModel> accountsList = accountsJson
        .map((account) => EmailPasswordModel.fromJson(account))
        .toList();
    return AdminAccountList(accounts: accountsList);
  }

  // Convert AdminAccountList to JSON
  Map<String, dynamic> toJson() {
    return {
      "\"accounts\"": accounts.map((account) => account.toJson()).toList(),
    };
  }
}
