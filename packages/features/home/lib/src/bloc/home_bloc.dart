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
          return state.copyWith(
            characters: characters,
            charactersFiltered: [
              ...state.charactersFiltered,
              ...characters.results
            ],
            status: ViewStatus.success,
            loadingNewData: false,
            lastPage: characters.next == null,
          );
        },
      );
    }
  }
}
