part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class GetCharactersEvent extends HomeEvent {
  const GetCharactersEvent(this.next);

  final String? next;

  @override
  List<Object?> get props => [next];
}
