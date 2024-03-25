import 'package:catalog/catalog.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const commit = Character.empty;

  group('Entity', () {
    test('should be a subclass of Character entity', () {
      expect(commit, isA<Character>());
    });

    test('should be a Character empty', () {
      const commitEmpty = Character(
        name: '',
        gender: Gender.none,
        films: [],
      );
      expect(commit, commitEmpty);
    });
  });
}
