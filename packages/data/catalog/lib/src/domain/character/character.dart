import '../film/film.dart';

class Character {
  final String name;
  final Gender gender;
  final List<Film> films;

  Character({
    required this.name,
    required this.gender,
    required this.films,
  });
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
