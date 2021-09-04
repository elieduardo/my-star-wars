import 'package:flutter/material.dart';
import 'package:my_star_wars/shared/models/film_model.dart';
import '../../shared/widgets/film_tile_widget.dart';

class FilmsList extends StatefulWidget {
  final List<FilmModel> films;
  const FilmsList({
    Key? key,
    required this.films,
  }) : super(key: key);

  @override
  _FilmsListState createState() => _FilmsListState();
}

class _FilmsListState extends State<FilmsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 5),
        itemCount: widget.films.length,
        itemBuilder: (context, i) {
          return FilmTileWidget(film: widget.films[i]);
        },
      ),
    );
  }
}
