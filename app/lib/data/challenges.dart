import 'package:app/models/activity.dart';
import 'package:app/models/challenge.dart';
import 'package:app/models/comment.dart';
import 'package:app/models/user.dart';

final _useCurrentTime = true;
final _baseTime = _useCurrentTime
    ? DateTime.now().subtract(Duration(hours: 2))
    : DateTime.parse('2020-09-19T10:00:00');

List<Challenge> challenges = _challenges();
List<User> users = _users();
List<Activity> activities = _activities();
List<Comment> comments = _comments();

List<Challenge> _challenges() => [
      Challenge(
        id: '1',
        challengeName: '24h Triathlon',
        teamName: 'Coding Corp',
        startsAt: _baseTime,
        users: users,
        activities: activities,
        comments: comments,
      ),
      Challenge(
        id: '2',
        challengeName: '1000 km Relay',
        teamName: 'Coding Corp',
        startsAt: _baseTime.subtract(Duration(hours: 4)),
        users: [users[0], users[1]],
        activities: [],
        comments: comments,
      ),
      Challenge(
        id: '3',
        challengeName: '50 Countries',
        teamName: 'Coding Corp',
        startsAt: _baseTime.add(Duration(hours: 5)),
        users: users,
        activities: [],
        comments: comments,
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
        sport: sports[2],
        duration: Duration(hours: 1),
        startsAt: _baseTime,
        user: users[0],
      ),
      Activity(
        id: '2',
        sport: sports[1],
        duration: Duration(hours: 1, minutes: 30),
        startsAt: _baseTime.add(Duration(hours: 1)),
        user: users[1],
      ),
      Activity(
        id: '3',
        sport: sports[0],
        duration: Duration(hours: 2, minutes: 30),
        startsAt: _baseTime.add(Duration(hours: 3, minutes: 30)),
        user: users[2],
      ),
    ];

List<Comment> _comments() => [
  Comment(
    id: '1',
    user_id: '1',
    text: 'Go Go go',
  ),
  Comment(
    id: '2',
    user_id: '2',
    text: 'Duration(hours: 1, minutes: 30)',
  ),
  Comment(
    id: '3',
    user_id: '3',
    text: 'already tired ?',
  ),
];


final sports = ['cycling', 'running', 'swimming'];

Activity activityReadyToStart(User currentUser, Challenge challenge) =>
    challenge.activities.firstWhere(
      (element) => element.user.id == currentUser.id && element.readyToStart,
      orElse: () => null,
    );
