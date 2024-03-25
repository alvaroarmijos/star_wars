import 'package:utility/utility.dart';

import '../character/character.dart';

class Characters extends Equatable {
  final int count;
  final String? next;
  final List<Character> results;

  const Characters({
    required this.count,
    this.next,
    required this.results,
  });

  static const empty = Characters(
    count: 0,
    results: [],
  );

  @override
  List<Object?> get props => [count, next, results];
}
