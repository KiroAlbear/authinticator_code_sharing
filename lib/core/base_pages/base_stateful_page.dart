import 'package:code_grapper/imports.dart';
import 'package:flutter/material.dart';

abstract class BaseStatefulPage extends StatefulWidget {
  const BaseStatefulPage({super.key});
}

abstract class BaseState<T extends BaseStatefulPage> extends State<T>
    with BasePageMixin {
  @override
  Widget? bottomSheet() => null;

  @override
  Widget? backgroundImage() => null;

  @override
  PreferredSizeWidget? appBar() => CustomAppbar(title: "");

  @override
  Widget? appbarWidget() => null;

  @override
  bool containPadding() => true;

  @override
  bool hasSideMenu() => true;

  @override
  bool showOnlyLogout() => false;

  Future<EmailPasswordModel> getChosenAdmin() async {
    return await CommonUtils.getChosenAdminOrUser(
        SecureStorageKeys.chosenAdminKey);
  }

  Future<AdminAccountList> getAdminAccountList() async {
    return await CommonUtils.getAdminAccountList();
  }

  Future<EmailPasswordModel> getChosenUser() async {
    return await CommonUtils.getChosenAdminOrUser(SecureStorageKeys.normalUser);
  }

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  @override
  void initState() {
    if (appBar() != null && appbarWidget() != null) {
      throw Exception(
          "You can't use both appbar and appbarWidget at the same time");
    }
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        AppToast.fToast.init(context);
      },
    );
    super.initState();
  }
}
