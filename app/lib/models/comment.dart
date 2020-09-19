import 'package:meta/meta.dart';

@immutable
class Comment {
  final String id;
  final String userName;
  final String text;

  Comment({
    @required this.id,
    @required this.userName,
    @required this.text,
  });
}
