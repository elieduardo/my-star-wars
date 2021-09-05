import 'package:flutter/cupertino.dart';
import 'package:my_star_wars/modules/home/home_state.dart';
import 'package:my_star_wars/modules/home/widgets/tab_view_home.dart';
import 'package:my_star_wars/modules/user_icon/user_icon_edit.dart';
import 'package:my_star_wars/shared/widgets/web_view_widget.dart';
import 'package:my_star_wars/shared/app_controller.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.home);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  Widget getBody({required AppController appController}) {
    switch (this.state) {
      case HomeState.home:
        return TabViewHome(appController: appController);
      case HomeState.webView:
        return WebViewWidget();
      case HomeState.userPersonalization:
        return UserIconEdit();
    }
  }
}
