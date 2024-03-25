import 'package:flutter_test/flutter_test.dart';
import 'package:home/home.dart';

void main() {
  test(
      'GetCharactersEvent supports value comparisions',
      () => expect(
          const GetCharactersEvent(null), const GetCharactersEvent(null)));

  test('AddFilterEvent supports value comparisions',
      () => expect(const AddFilterEvent(null), const AddFilterEvent(null)));
}
