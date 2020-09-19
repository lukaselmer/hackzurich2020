import 'package:app/models/user.dart';
import 'package:meta/meta.dart';

@immutable
class Activity {
  final String id;
  final String sport;
  final DateTime startsAt;
  final Duration duration;
  final User user;

  Activity({
    @required this.id,
    @required this.sport,
    @required this.startsAt,
    @required this.duration,
    @required this.user,
  });

  int calculateScore() => 42;

  DateTime get endsAt => startsAt.add(duration);

  bool get running => started && !ended;

  bool get started => DateTime.now().isAfter(startsAt);

  bool get ended => DateTime.now().isBefore(endsAt);
}
