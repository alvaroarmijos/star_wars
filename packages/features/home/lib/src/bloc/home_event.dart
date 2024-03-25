part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class GetCharactersEvent extends HomeEvent {
  const GetCharactersEvent(this.next);

  final String? next;
}

class AddFilterEvent extends HomeEvent {
  const AddFilterEvent(this.filter);

  final Gender? filter;
}
