import 'package:flutter/cupertino.dart';
import 'package:my_star_wars/modules/home/home_state.dart';
import 'package:my_star_wars/modules/home/widgets/tab_view_home.dart';
import 'package:my_star_wars/modules/web_view/web_view_widget.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.home);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  Widget getBody() {
    switch (this.state) {
      case HomeState.home:
        return TabViewHome();
      case HomeState.webView:
        return WebViewWidget();
      case HomeState.userPersonalization:
        return TabViewHome();
    }
  }
}
