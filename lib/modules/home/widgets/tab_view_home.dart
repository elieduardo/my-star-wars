import 'package:flutter/material.dart';
import 'package:my_star_wars/core/app_colors.dart';

class TabViewHome extends StatefulWidget {
  const TabViewHome({Key? key}) : super(key: key);

  @override
  _TabViewHomeState createState() => _TabViewHomeState();
}

class _TabViewHomeState extends State<TabViewHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: AppColors.darkBlue,
            child: TabBar(
              indicatorColor: AppColors.yellow,
              labelColor: AppColors.yellow,
              unselectedLabelColor: AppColors.white,
              tabs: [
                Tab(
                  text: "Filmes",
                ),
                Tab(
                  text: "Personagens",
                ),
                Tab(
                  text: "Favoritos",
                )
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                Container(
                  child: Center(
                    child: Text("Filmes"),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text("Personagens"),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text("Favoritos"),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
