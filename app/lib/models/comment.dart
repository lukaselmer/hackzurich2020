import 'package:app/models/user.dart';
import 'package:meta/meta.dart';

@immutable
class Comment {
  final String id;
  final String user_name;
  final String text;

  Comment({
    @required this.id,
    @required this.user_name,
    @required this.text,
  });

}
