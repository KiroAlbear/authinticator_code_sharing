import 'package:code_grapper/imports.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

abstract class BaseStatefulPage extends StatefulWidget {
  const BaseStatefulPage({super.key});
}

abstract class BaseState<T extends BaseStatefulPage> extends State<T>
    with BasePageMixin, TickerProviderStateMixin {
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

  @override
  bool hasSocialMedia() => true;

  late final GifController _controller;

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
    return Stack(
      fit: StackFit.expand,
      children: [
        Gif(
          image: AssetImage(Assets.images.gif.background.path),
          fit: BoxFit.fill,
          controller: _controller,
          repeat: ImageRepeat.repeat,
          onFetchCompleted: () {
            _controller.reset();
            _controller.repeat();
          },
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white.withOpacity(0.7),
        ),
        buildBody(context),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
    _controller = GifController(vsync: this);
    super.initState();
  }
}
