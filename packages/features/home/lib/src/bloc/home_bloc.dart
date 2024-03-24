import 'dart:async';

import 'package:catalog/catalog.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:utility/utility.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._getCharactersUseCase,
  ) : super(const HomeState()) {
    on<GetCharactersEvent>(_onGetCharactersEvent);

    controller.addPageRequestListener((key) {
      print(key);
      add(GetCharactersEvent(key));
    });
  }

  final GetCharactersUseCase _getCharactersUseCase;

  final controller = PagingController<String?, Character>(firstPageKey: null);

  FutureOr<void> _onGetCharactersEvent(
    GetCharactersEvent event,
    Emitter<HomeState> emit,
  ) {
    return emit.forEach<Characters>(
      _getCharactersUseCase(event.next),
      onData: (characters) {
        final isLastPage = characters.next == null;

        if (isLastPage) {
          controller.appendLastPage(characters.results);
        } else {
          controller.appendPage(characters.results, characters.next);
        }
        return state.copyWith(
          characters: characters.results,
        );
      },
    );
  }
}
