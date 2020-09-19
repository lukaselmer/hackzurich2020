import 'package:app/models/user.dart';
import 'package:meta/meta.dart';

@immutable
class Comment {
  final String id;
  final String user_id;
  final String text;

  Comment({
    @required this.id,
    @required this.user_id,
    @required this.text,
  });

}
