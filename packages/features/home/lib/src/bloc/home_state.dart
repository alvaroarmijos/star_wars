part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.characters = Characters.empty,
    this.status = ViewStatus.loading,
    this.loadingNewData = false,
    this.lastPage = false,
    List<Character>? charactersFiltered,
  }) : charactersFiltered = charactersFiltered ?? const [];

  final List<Character> charactersFiltered;
  final Characters characters;
  final ViewStatus status;
  final bool loadingNewData;
  final bool lastPage;

  HomeState copyWith({
    List<Character>? charactersFiltered,
    Characters? characters,
    ViewStatus? status,
    bool? loadingNewData,
    bool? lastPage,
  }) =>
      HomeState(
        characters: characters ?? this.characters,
        status: status ?? this.status,
        loadingNewData: loadingNewData ?? this.loadingNewData,
        charactersFiltered: charactersFiltered ?? this.charactersFiltered,
        lastPage: lastPage ?? this.lastPage,
      );

  @override
  List<Object?> get props => [
        characters,
        charactersFiltered,
        status,
        loadingNewData,
        lastPage,
      ];
}
