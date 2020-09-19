import 'package:app/data/challenges.dart';
import 'package:app/models/challenge.dart';

List<Challenge> myChallenges() => challenges;

List<Challenge> pastChallenges() =>
    challenges.where((element) => (element.ended)).toList();

List<Challenge> currentChallenges() =>
    challenges.where((element) => element.running).toList();

List<Challenge> upcomingChallenges() => challenges
    .where((element) => (DateTime.now().isBefore(element.startsAt)))
    .toList();
