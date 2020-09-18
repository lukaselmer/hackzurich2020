import 'package:app/models/activity.dart';
import 'package:app/models/user.dart';
import 'package:meta/meta.dart';

@immutable
class Challenge {
  final String id;
  final String challengeName;
  final String teamName;
  final DateTime startingAt;
  final List<User> users = [];
  final List<Activity> activities = [];

  Challenge({this.id, this.challengeName, this.teamName, this.startingAt});

  int get totalDuration => activities
      .map((activity) => activity.duration)
      .reduce((value, element) => value + element);
}
