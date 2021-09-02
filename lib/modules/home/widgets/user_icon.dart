import 'package:flutter/material.dart';

class UserIcon extends StatefulWidget {
  const UserIcon({Key? key}) : super(key: key);

  @override
  _UserIconState createState() => _UserIconState();
}

class _UserIconState extends State<UserIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      height: 58,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        image: DecorationImage(
          image: NetworkImage(
              "https://avatars.githubusercontent.com/u/55281597?v=4"),
        ),
      ),
    );
  }
}
