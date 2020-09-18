import 'package:app/models/user.dart';
import 'package:meta/meta.dart';

@immutable
class Activity {
  final String id;
  final String sport;
  final DateTime startingAt;
  final Duration duration;
  final User user;

  Activity({
    @required this.id,
    @required this.sport,
    @required this.startingAt,
    @required this.duration,
    @required this.user,
  });

  int calculateScore() {
    return 42;
  }
}
