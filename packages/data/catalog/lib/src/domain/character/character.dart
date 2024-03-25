import 'package:utility/utility.dart';

import '../film/film.dart';

class Character extends Equatable {
  final String name;
  final Gender gender;
  final List<Film> films;

  const Character({
    required this.name,
    required this.gender,
    required this.films,
  });

  static const empty = Character(
    name: '',
    gender: Gender.none,
    films: [],
  );

  @override
  List<Object?> get props => [name, gender, films];
}

enum Gender {
  female,
  male,
  none,
  hermaphrodite,
  all,
}

final genderValues = EnumValues({
  "female": Gender.female,
  "male": Gender.male,
  "hermaphrodite": Gender.hermaphrodite,
  "none": Gender.none,
  "n/a": Gender.none,
  "all": Gender.all,
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
