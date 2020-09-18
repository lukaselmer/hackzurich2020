import 'package:app/models/activity.dart';
import 'package:app/models/challenge.dart';
import 'package:app/models/user.dart';

List<Challenge> challenges() => [
      Challenge(
        id: '1',
        challengeName: '24h Triathlon',
        teamName: 'TeamName',
        startingAt: DateTime.parse('2020-09-19T10:00:00'),
        users: users(),
        activities: activities(),
      ),
      Challenge(
        id: '2',
        challengeName: 'Cycling Tour',
        teamName: 'TeamName',
        startingAt: DateTime.parse('2020-09-19T12:00:00'),
        users: [users()[0], users()[1]],
        activities: [],
      ),
      Challenge(
        id: '3',
        challengeName: 'Walking',
        teamName: 'TeamName',
        startingAt: DateTime.parse('2020-09-19T17:00:00'),
        users: users(),
        activities: [],
      ),
    ];

List<User> users() => [
      User(id: '1', name: 'Marion'),
      User(id: '2', name: 'Marco'),
      User(id: '3', name: 'Christof'),
      User(id: '4', name: 'Lukas'),
    ];

List<Activity> activities() => [
      Activity(
        id: '1',
        sport: 'swimming',
        duration: Duration(hours: 1),
        startingAt: DateTime.parse('2020-09-19T10:00:00'),
        user: users()[0],
      ),
      Activity(
        id: '2',
        sport: 'running',
        duration: Duration(hours: 1, minutes: 30),
        startingAt: DateTime.parse('2020-09-19T11:00:00'),
        user: users()[1],
      ),
      Activity(
        id: '3',
        sport: 'cycling',
        duration: Duration(hours: 2, minutes: 30),
        startingAt: DateTime.parse('2020-09-19T13:30:00'),
        user: users()[3],
      ),
    ];
