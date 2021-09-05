import 'package:flutter/material.dart';
import 'package:my_star_wars/core/app_colors.dart';
import 'package:my_star_wars/core/app_text_styles.dart';
import 'package:my_star_wars/shared/data/data_base.dart';

import 'package:my_star_wars/shared/models/person_model.dart';

class PersonTileWidget extends StatefulWidget {
  final PersonModel data;
  const PersonTileWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _PersonTileWidgetState createState() => _PersonTileWidgetState();
}

class _PersonTileWidgetState extends State<PersonTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                color: AppColors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 6,
                offset: Offset(0, 1)),
          ],
        ),
        child: ListTile(
          title: Text(
            widget.data.name,
            style: AppTextStyles.titleMedium,
          ),
          trailing: widget.data.isFavorite
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
              DataBase().updateFavoritePerson(widget.data);
            });
          },
        ),
      ),
    );
  }
}
