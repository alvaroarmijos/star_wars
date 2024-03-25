import '../character/character.dart';

class Characters {
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
}
