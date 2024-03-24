import 'dart:convert';

class CharactersDto {
  final int count;
  final String? next;
  final String? previous;
  final List<CharacterDto> results;

  CharactersDto({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory CharactersDto.fromRawJson(String str) =>
      CharactersDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CharactersDto.fromJson(Map<String, dynamic> json) => CharactersDto(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<CharacterDto>.from(
                json["results"]!.map((x) => CharacterDto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class CharacterDto {
  final String? name;
  final String? height;
  final String? mass;
  final String? hairColor;
  final String? skinColor;
  final String? eyeColor;
  final String? birthYear;
  final String? gender;
  final String? homeworld;
  final List<String>? films;
  final List<String>? species;
  final List<dynamic>? vehicles;
  final List<String>? starships;
  final DateTime? created;
  final DateTime? edited;
  final String? url;

  CharacterDto({
    this.name,
    this.height,
    this.mass,
    this.hairColor,
    this.skinColor,
    this.eyeColor,
    this.birthYear,
    this.gender,
    this.homeworld,
    this.films,
    this.species,
    this.vehicles,
    this.starships,
    this.created,
    this.edited,
    this.url,
  });

  factory CharacterDto.fromRawJson(String str) =>
      CharacterDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CharacterDto.fromJson(Map<String, dynamic> json) => CharacterDto(
        name: json["name"],
        height: json["height"],
        mass: json["mass"],
        hairColor: json["hair_color"],
        skinColor: json["skin_color"],
        eyeColor: json["eye_color"],
        birthYear: json["birth_year"],
        gender: json["gender"]!,
        homeworld: json["homeworld"],
        films: json["films"] == null
            ? []
            : List<String>.from(json["films"]!.map((x) => x)),
        species: json["species"] == null
            ? []
            : List<String>.from(json["species"]!.map((x) => x)),
        vehicles: json["vehicles"] == null
            ? []
            : List<dynamic>.from(json["vehicles"]!.map((x) => x)),
        starships: json["starships"] == null
            ? []
            : List<String>.from(json["starships"]!.map((x) => x)),
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        edited: json["edited"] == null ? null : DateTime.parse(json["edited"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "height": height,
        "mass": mass,
        "hair_color": hairColor,
        "skin_color": skinColor,
        "eye_color": eyeColor,
        "birth_year": birthYear,
        "gender": gender,
        "homeworld": homeworld,
        "films": films == null ? [] : List<dynamic>.from(films!.map((x) => x)),
        "species":
            species == null ? [] : List<dynamic>.from(species!.map((x) => x)),
        "vehicles":
            vehicles == null ? [] : List<dynamic>.from(vehicles!.map((x) => x)),
        "starships": starships == null
            ? []
            : List<dynamic>.from(starships!.map((x) => x)),
        "created": created?.toIso8601String(),
        "edited": edited?.toIso8601String(),
        "url": url,
      };
}
