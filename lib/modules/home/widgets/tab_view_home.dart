import 'package:flutter/material.dart';

import 'package:my_star_wars/core/app_colors.dart';
import 'package:my_star_wars/modules/favorites/favorite_list_widget.dart';
import 'package:my_star_wars/modules/film/films_list_widget.dart';
import 'package:my_star_wars/modules/people/people_list_widget.dart';
import 'package:my_star_wars/shared/app_controller.dart';

class TabViewHome extends StatefulWidget {
  final AppController appController;
  const TabViewHome({
    Key? key,
    required this.appController,
  }) : super(key: key);

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
                FilmsList(
                  films: widget.appController.films,
                ),
                PeopleList(
                  people: widget.appController.people,
                ),
                FavoriteList(
                  appController: widget.appController,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
