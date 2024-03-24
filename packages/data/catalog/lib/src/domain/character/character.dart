import 'dart:convert';

class Character {
  final String name;
  final Gender gender;
  final List<String> films;

  Character({
    required this.name,
    required this.gender,
    required this.films,
  });

  factory Character.fromRawJson(String str) =>
      Character.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        name: json["name"],
        gender: genderValues.map[json["gender"]]!,
        films: json["films"] == null
            ? []
            : List<String>.from(json["films"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "gender": genderValues.reverse[gender],
        "films": List<dynamic>.from(films.map((x) => x)),
      };
}

enum Gender {
  female,
  male,
  none,
  hermaphrodite,
}

final genderValues = EnumValues({
  "female": Gender.female,
  "male": Gender.male,
  "hermaphrodite": Gender.hermaphrodite,
  "none": Gender.none,
  "n/a": Gender.none,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
