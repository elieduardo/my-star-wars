import 'package:flutter/material.dart';
import 'package:my_star_wars/core/app_colors.dart';
import 'package:my_star_wars/core/app_text_styles.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const ButtonWidget({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 120,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(38),
            ),
          ),
          overlayColor: MaterialStateProperty.all(AppColors.yellow),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: AppTextStyles.titleRegular,
        ),
      ),
    );
  }
}
