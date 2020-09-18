import 'package:app/models/user.dart';
import 'package:meta/meta.dart';

@immutable
class Activity {
  final String id;
  final String sport;
  final DateTime startingAt;
  final int duration;
  final User user;

  Activity({this.id, this.sport, this.startingAt, this.duration, this.user});

  int calculateScore() {
    return 42;
  }
}
