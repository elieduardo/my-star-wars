import 'package:flutter/material.dart';
import 'package:my_star_wars/core/app_colors.dart';
import 'package:my_star_wars/core/app_text_styles.dart';
import 'package:my_star_wars/shared/data/data_base.dart';
import 'package:my_star_wars/shared/models/film_model.dart';

class FilmTileWidget extends StatefulWidget {
  final FilmModel film;

  const FilmTileWidget({
    Key? key,
    required this.film,
  }) : super(key: key);

  @override
  _FilmTileWidgetState createState() => _FilmTileWidgetState();
}

class _FilmTileWidgetState extends State<FilmTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.greyLight,
        ),
        child: ListTile(
          title: Text(
            widget.film.title,
            style: AppTextStyles.titleMedium,
          ),
          trailing: widget.film.isFavorite
              ? Icon(
                  Icons.favorite,
                  color: AppColors.red,
                )
              : Icon(
                  Icons.favorite_border,
                  color: AppColors.redLight,
                ),
          onTap: () {
            setState(() {
              DataBase().updateFavoriteFilm(widget.film);
            });
          },
        ),
      ),
    );
  }
}
