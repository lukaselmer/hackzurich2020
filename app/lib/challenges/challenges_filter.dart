import 'package:app/data/challenges.dart';
import 'package:app/models/challenge.dart';

List<Challenge> myChallenges() => challenges;

List<Challenge> pastChallenges() => challenges
    .where((element) => (DateTime.now().isAfter(element.startsAt)))
    .toList();

List<Challenge> currentChallenges() => challenges
    .where((element) => (DateTime.now().isAfter(element.startsAt) &&
        DateTime.now().isBefore(element.startsAt.add(element.totalDuration))))
    .toList();

List<Challenge> upcomingChallenges() => challenges
    .where((element) => (DateTime.now().isBefore(element.startsAt)))
    .toList();
