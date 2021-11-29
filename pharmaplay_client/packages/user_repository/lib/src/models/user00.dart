import 'package:equatable/equatable.dart';

class User00 extends Equatable {
  const User00(this.id);

  final String id;

  @override
  List<Object> get props => [id];

  static const empty = User00('');
}
