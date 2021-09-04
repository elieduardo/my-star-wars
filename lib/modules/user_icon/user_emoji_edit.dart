import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';

class UserIconEdit extends StatefulWidget {
  const UserIconEdit({Key? key}) : super(key: key);

  @override
  _UserIconEditState createState() => _UserIconEditState();
}

class _UserIconEditState extends State<UserIconEdit> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FluttermojiCircleAvatar(
            radius: 65,
            backgroundColor: Colors.transparent,
          ),
          FluttermojiCustomizer(
            scaffoldHeight: 300,
          ),
        ],
      ),
    );
  }
}
