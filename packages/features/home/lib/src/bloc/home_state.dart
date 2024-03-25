part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.characters = Characters.empty,
    this.status = ViewStatus.loading,
    this.loadingNewData = false,
    this.lastPage = false,
    this.filter = Gender.all,
    List<Character>? charactersFiltered,
    List<Character>? allCharacters,
  })  : charactersFiltered = charactersFiltered ?? const [],
        allCharacters = allCharacters ?? const [];

  final List<Character> charactersFiltered;
  final List<Character> allCharacters;
  final Characters characters;
  final ViewStatus status;
  final bool loadingNewData;
  final bool lastPage;
  final Gender filter;

  HomeState copyWith({
    List<Character>? charactersFiltered,
    List<Character>? allCharacters,
    Characters? characters,
    ViewStatus? status,
    bool? loadingNewData,
    bool? lastPage,
    Gender? filter,
  }) =>
      HomeState(
        characters: characters ?? this.characters,
        allCharacters: allCharacters ?? this.allCharacters,
        status: status ?? this.status,
        loadingNewData: loadingNewData ?? this.loadingNewData,
        charactersFiltered: charactersFiltered ?? this.charactersFiltered,
        lastPage: lastPage ?? this.lastPage,
        filter: filter ?? this.filter,
      );

  @override
  List<Object?> get props => [
        characters,
        charactersFiltered,
        allCharacters,
        status,
        loadingNewData,
        lastPage,
        filter,
      ];
}
