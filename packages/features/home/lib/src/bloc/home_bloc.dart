import 'dart:async';

import 'package:catalog/catalog.dart';
import 'package:utility/utility.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._getCharactersUseCase,
  ) : super(const HomeState.loading()) {
    on<GetCharactersEvent>(_onGetCharactersEvent);
  }

  final GetCharactersUseCase _getCharactersUseCase;

  FutureOr<void> _onGetCharactersEvent(
    GetCharactersEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(const HomeState.loading());
    return emit.forEach<Characters>(
      _getCharactersUseCase(event.next),
      onData: (characters) {
        return HomeState.success(
          characters,
        );
      },
      onError: (_, __) => const HomeState.failure(),
    );
  }
}
