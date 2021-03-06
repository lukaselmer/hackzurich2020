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

  double get kmMoved {
    final kilometerMapping = {
      'cycling': 57.2,
      'running': 12.8,
      'swimming': 2.3,
    };
    return kilometerMapping[sport] ?? 42.0;
  }

  DateTime get endsAt => startsAt.add(duration);

  bool get readyToStart => !started && _withinTenMinutesBeforeStarting;

  bool get _withinTenMinutesBeforeStarting {
    final tenMinutesAgo = startsAt.subtract(Duration(minutes: 10));
    return DateTime.now().isAfter(tenMinutesAgo);
  }

  bool get running => started && !ended;

  bool get started => DateTime.now().isAfter(startsAt);

  bool get ended => DateTime.now().isAfter(endsAt);
}
