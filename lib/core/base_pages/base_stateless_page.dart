import 'package:flutter/material.dart';
import 'package:key_bridge/imports.dart';

abstract class BaseStatelessPage extends StatelessWidget with BasePageMixin {
  const BaseStatelessPage({super.key});

  @override
  Widget? bottomSheet() => null;

  @override
  Widget? backgroundImage() => null;

  @override
  PreferredSizeWidget? appBar() => null;

  @override
  Widget? appbarWidget() => null;

  @override
  bool containPadding() => true;

  @override
  bool hasSideMenu() => true;

  @override
  bool showOnlyLogout() => false;

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }
}
