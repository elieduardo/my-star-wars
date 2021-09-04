import 'package:flutter/material.dart';
import 'package:my_star_wars/shared/models/person_model.dart';
import 'package:my_star_wars/shared/widgets/person_tile_widget.dart';

class PeopleList extends StatefulWidget {
  final List<PersonModel> people;
  const PeopleList({
    Key? key,
    required this.people,
  }) : super(key: key);

  @override
  _PeopleListState createState() => _PeopleListState();
}

class _PeopleListState extends State<PeopleList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 5),
      itemCount: widget.people.length,
      itemBuilder: (context, i) {
        return PersonTileWidget(data: widget.people[i]);
      },
    );
  }
}
