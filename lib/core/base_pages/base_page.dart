part of 'base_page_mixin.dart';

sealed class BasePage {
  Widget? appbarWidget();

  Widget? bottomSheet();

  PreferredSizeWidget? appBar();

  bool containPadding();

  bool hasSideMenu() => true;

  bool showOnlyLogout() => false;

  bool hasSocialMedia() => true;

  Widget body(BuildContext context);

// bool isMainPage();
}
