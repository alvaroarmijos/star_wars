part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    List<Character>? characters,
  }) : characters = characters ?? const [];

  final List<Character> characters;

  HomeState copyWith({
    List<Character>? characters,
  }) =>
      HomeState(
        characters: characters ?? this.characters,
      );

  @override
  List<Object?> get props => [characters];
}
