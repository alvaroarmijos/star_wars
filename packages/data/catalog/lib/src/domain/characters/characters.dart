import 'dart:convert';

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

  factory Characters.fromRawJson(String str) =>
      Characters.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Characters.fromJson(Map<String, dynamic> json) => Characters(
        count: json["count"],
        next: json["next"],
        results: json["results"] == null
            ? []
            : List<Character>.from(
                json["results"]!.map((x) => Character.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
