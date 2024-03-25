import 'package:catalog/catalog.dart';
import 'package:flutter/material.dart';
import 'package:home/src/widgets/character_item.dart';

class HomeSuccess extends StatelessWidget {
  const HomeSuccess({
    Key? key,
    this.onScrollEndNotification,
    required this.characters,
    required this.loadingNewData,
  }) : super(key: key);

  final VoidCallback? onScrollEndNotification;
  final List<Character> characters;
  final bool loadingNewData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollEndNotification &&
                notification.metrics.extentAfter == 0) {
              // User has reached the end of the list
              // Load more data
              onScrollEndNotification?.call();
            }
            return false;
          },
          child: ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) => CharacterItem(
              character: characters[index],
            ),
          ),
        ),
        if (loadingNewData)
          const Align(
            alignment: Alignment.bottomCenter,
            child: LinearProgressIndicator(),
          )
      ],
    );
  }
}
