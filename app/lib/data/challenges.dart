import 'package:app/models/activity.dart';
import 'package:app/models/challenge.dart';
import 'package:app/models/user.dart';

final _useCurrentTime = true;
final _baseTime = _useCurrentTime
    ? DateTime.now().subtract(Duration(hours: 2))
    : DateTime.parse('2020-09-19T10:00:00');

List<Challenge> challenges = _challenges();
List<User> users = _users();
List<Activity> activities = _activities();

List<Challenge> _challenges() => [
      Challenge(
        id: '1',
        challengeName: '24h Triathlon',
        teamName: 'TeamName',
        startingAt: _baseTime,
        users: users,
        activities: activities,
      ),
      Challenge(
        id: '2',
        challengeName: 'Cycling Tour',
        teamName: 'TeamName',
        startingAt: _baseTime.add(Duration(hours: 2)),
        users: [users[0], users[1]],
        activities: [],
      ),
      Challenge(
        id: '3',
        challengeName: 'Walking',
        teamName: 'TeamName',
        startingAt: _baseTime.add(Duration(hours: 5)),
        users: users,
        activities: [],
      ),
    ];

List<User> _users() => [
      User(id: '1', name: 'Marion'),
      User(id: '2', name: 'Marco'),
      User(id: '3', name: 'Christof'),
      User(id: '4', name: 'Lukas'),
    ];

List<Activity> _activities() => [
      Activity(
        id: '1',
        sport: 'swimming',
        duration: Duration(hours: 1),
        startingAt: _baseTime,
        user: users[0],
      ),
      Activity(
        id: '2',
        sport: 'running',
        duration: Duration(hours: 1, minutes: 30),
        startingAt: _baseTime.add(Duration(hours: 1)),
        user: users[1],
      ),
      Activity(
        id: '3',
        sport: 'cycling',
        duration: Duration(hours: 2, minutes: 30),
        startingAt: _baseTime.add(Duration(hours: 3, minutes: 30)),
        user: users[3],
      ),
    ];
