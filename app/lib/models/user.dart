import 'package:meta/meta.dart';

@immutable
class User {
  final String id;
  final String name;

  User({@required this.id, @required this.name});
}
