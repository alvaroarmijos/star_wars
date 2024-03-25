import 'package:catalog/src/domain/film/film.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const commit = Film.empty;

  group('Entity', () {
    test('should be a subclass of Film entity', () {
      expect(commit, isA<Film>());
    });

    test('should be a Commit empty', () {
      const commitEmpty = Film(
        title: '',
      );
      expect(commit, commitEmpty);
    });
  });
}
