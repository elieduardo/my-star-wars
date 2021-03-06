import 'package:flutter/material.dart';
import 'package:my_star_wars/core/app_images.dart';
import 'package:my_star_wars/core/app_text.dart';
import 'package:my_star_wars/core/app_text_styles.dart';
import 'package:my_star_wars/shared/app_controller.dart';
import 'package:my_star_wars/shared/models/favorite_model.dart';
import 'package:my_star_wars/shared/widgets/favorite_tile_widget.dart';

class FavoriteList extends StatefulWidget {
  final AppController appController;
  const FavoriteList({
    Key? key,
    required this.appController,
  }) : super(key: key);

  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  List<FavoriteModel> _favorites = [];

  @override
  void initState() {
    for (var person in widget.appController.people) {
      if (person.isFavorite) {
        _favorites.add(FavoriteModel(name: person.name, isPerson: true));
      }
    }
    for (var film in widget.appController.films) {
      if (film.isFavorite) {
        _favorites.add(FavoriteModel(name: film.title, isPerson: false));
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _favorites.length >= 1
        ? ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 5),
            itemCount: _favorites.length,
            itemBuilder: (context, i) {
              return FavoriteTileWidget(favorite: _favorites[i]);
            },
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Image.asset(
                  AppImages.listEmpty,
                  width: 200,
                  height: 200,
                ),
              ),
              Text(
                AppText.emptyList,
                style: AppTextStyles.titleMedium,
              )
            ],
          );
  }
}
