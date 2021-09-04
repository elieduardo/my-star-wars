import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:my_star_wars/core/app_colors.dart';

class UserIcon extends StatefulWidget {
  const UserIcon({Key? key}) : super(key: key);

  @override
  _UserIconState createState() => _UserIconState();
}

class _UserIconState extends State<UserIcon> {
  @override
  Widget build(BuildContext context) {
    return FluttermojiCircleAvatar(
      backgroundColor: AppColors.white,
      radius: 35,
    );
  }
}
