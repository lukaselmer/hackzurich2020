import 'package:app/data/challenges.dart';
import 'package:app/models/challenge.dart';

List<Challenge> currentChallenges() =>
    challenges.where((element) => element.current).toList();

List<Challenge> pastChallenges() =>
    challenges.where((element) => (element.ended)).toList();

List<Challenge> myChallenges() => challenges;
