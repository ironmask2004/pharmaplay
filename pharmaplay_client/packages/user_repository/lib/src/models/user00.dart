import 'package:equatable/equatable.dart';

class User001 extends Equatable {
  const User001(this.id);

  final String id;

  @override
  List<Object> get props => [id];

  static const empty = User001('');
}
