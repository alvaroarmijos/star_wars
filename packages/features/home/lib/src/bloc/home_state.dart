part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState._({
    this.status = ViewStatus.loading,
    this.characters = Characters.empty,
  });

  const HomeState.loading() : this._();

  const HomeState.success(Characters characters)
      : this._(status: ViewStatus.success, characters: characters);

  const HomeState.failure() : this._(status: ViewStatus.failure);

  final ViewStatus status;
  final Characters characters;

  @override
  List<Object?> get props => [status, characters];
}
