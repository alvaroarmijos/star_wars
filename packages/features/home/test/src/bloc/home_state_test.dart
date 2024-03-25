import 'package:catalog/catalog.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/home.dart';
import 'package:utility/utility.dart';

void main() {
  group('HomeState', () {
    test('supports value comparision', () {
      expect(const HomeState(), const HomeState());
    });

    test('returns same object when no properties are passed', () {
      expect(const HomeState().copyWith(), const HomeState());
    });

    test('returns object with updated status when status is passed', () {
      expect(
        const HomeState().copyWith(status: ViewStatus.success),
        const HomeState(status: ViewStatus.success),
      );
    });

    test('returns object with updated status when filter is passed', () {
      expect(
        const HomeState().copyWith(filter: Gender.male),
        const HomeState(filter: Gender.male),
      );
    });
  });
}
