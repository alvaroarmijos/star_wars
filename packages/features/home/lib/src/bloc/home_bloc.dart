import 'dart:async';

import 'package:catalog/catalog.dart';
import 'package:utility/utility.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._getCharactersUseCase,
  ) : super(const HomeState()) {
    on<GetCharactersEvent>(_onGetCharactersEvent);
    on<AddFilterEvent>(_onAddFilterEvent);
  }

  final GetCharactersUseCase _getCharactersUseCase;

  FutureOr<void> _onGetCharactersEvent(
    GetCharactersEvent event,
    Emitter<HomeState> emit,
  ) {
    if (!state.loadingNewData && !state.lastPage) {
      if (state.charactersFiltered.isEmpty) {
        emit(state.copyWith(status: ViewStatus.loading));
      } else {
        emit(state.copyWith(loadingNewData: true));
      }
      return emit.forEach<Characters>(
        _getCharactersUseCase(event.next),
        onData: (characters) {
          final allCharacters = [...state.allCharacters, ...characters.results];

          final charactersFiltered = state.filter == Gender.all
              ? allCharacters
              : allCharacters
                  .where(
                    (character) => character.gender == state.filter,
                  )
                  .toList();

          return state.copyWith(
            characters: characters,
            allCharacters: allCharacters,
            charactersFiltered: charactersFiltered,
            status: ViewStatus.success,
            loadingNewData: false,
            lastPage: characters.next == null,
          );
        },
      );
    }
  }

  FutureOr<void> _onAddFilterEvent(
    AddFilterEvent event,
    Emitter<HomeState> emit,
  ) {
    final charactersFiltered = event.filter == Gender.all
        ? state.allCharacters
        : state.allCharacters
            .where(
              (character) => character.gender == event.filter,
            )
            .toList();

    emit(
      state.copyWith(
        charactersFiltered: charactersFiltered,
        filter: event.filter,
      ),
    );
  }
}
