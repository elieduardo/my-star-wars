import 'package:flutter/material.dart';
import 'package:my_star_wars/core/app_colors.dart';
import 'package:my_star_wars/core/app_text_styles.dart';
import 'package:my_star_wars/shared/models/favorite_model.dart';

class FavoriteTileWidget extends StatefulWidget {
  final FavoriteModel favorite;
  const FavoriteTileWidget({
    Key? key,
    required this.favorite,
  }) : super(key: key);

  @override
  _FavoriteTileWidgetState createState() => _FavoriteTileWidgetState();
}

class _FavoriteTileWidgetState extends State<FavoriteTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: widget.favorite.isPerson
              ? AppColors.greenLight.withOpacity(0.2)
              : AppColors.redLight.withOpacity(0.2),
        ),
        child: Center(
          child: Text(
            widget.favorite.name,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.titleMedium,
          ),
        ),
      ),
    );
  }
}
