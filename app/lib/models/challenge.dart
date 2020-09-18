import 'package:app/models/activity.dart';
import 'package:app/models/user.dart';
import 'package:meta/meta.dart';

@immutable
class Challenge {
  final String id;
  final String challengeName;
  final String teamName;
  final DateTime startingAt;
  final List<User> users;
  final List<Activity> activities;

  Challenge({
    @required this.id,
    @required this.challengeName,
    @required this.teamName,
    @required this.startingAt,
    @required this.users,
    @required this.activities,
  });

  Duration get totalDuration => activities
      .map((activity) => activity.duration)
      .reduce((value, element) => value + element);
}
