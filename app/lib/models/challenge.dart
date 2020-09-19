import 'package:app/models/activity.dart';
import 'package:app/models/comment.dart';
import 'package:app/models/user.dart';
import 'package:meta/meta.dart';

@immutable
class Challenge {
  final String id;
  final String challengeName;
  final String teamName;
  final DateTime startsAt;
  final List<User> users;
  final List<Activity> activities;
  final List<Comment> comments;

  Challenge({
    @required this.id,
    @required this.challengeName,
    @required this.teamName,
    @required this.startsAt,
    @required this.users,
    @required this.activities,
    @required this.comments,
  });

  Duration get totalDuration => activities
      .map((activity) => activity.duration)
      .fold(Duration(), (value, element) => value + element);

  bool get current => !ended;

  bool get running => started && !ended;

  bool get started => DateTime.now().isAfter(startsAt);

  bool get ended => DateTime.now().isAfter(endsAt);

  DateTime get endsAt => _lastActivity?.endsAt ?? startsAt;

  Activity get _lastActivity => activities.isEmpty ? null : activities.last;
}
