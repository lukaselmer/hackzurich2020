import 'package:app/challenges/challenge_page.dart';
import 'package:app/challenges/challenges_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Challenge',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: 'challenges',
        routes: {
          'challenges': (context) => ChallengesPage(),
          'challenge': (context) => ChallengePage(),
        },
      );
}
