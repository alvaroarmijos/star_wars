import 'package:catalog/catalog.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const commit = Characters.empty;

  group('Entity', () {
    test('should be a subclass of Characters entity', () {
      expect(commit, isA<Characters>());
    });

    test('should be a Characters empty', () {
      const commitEmpty = Characters(
        count: 0,
        results: [],
      );
      expect(commit, commitEmpty);
    });
  });
}
