import 'package:meta/meta.dart';

@immutable
class User {
  final String id;
  final String name;

  User({this.id, this.name});
}
