import 'package:catalog/catalog.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(character.name),
      trailing: Text(character.gender.name),
      subtitle: Text(
        character.films.map((film) => film.title).join(', '),
      ),
    );
  }
}
