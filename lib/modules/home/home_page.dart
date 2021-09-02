import 'package:flutter/material.dart';
import 'package:my_star_wars/modules/home/widgets/app_bar_widget.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        controller: controller,
      ),
      body: controller.getBody(),
    );
  }
}
