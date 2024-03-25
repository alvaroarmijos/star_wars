import 'package:utility/utility.dart';

class Film extends Equatable {
  final String title;

  const Film({
    required this.title,
  });

  static const empty = Film(title: '');

  @override
  List<Object?> get props => [title];
}
