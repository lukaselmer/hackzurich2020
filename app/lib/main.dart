import 'package:app/challenges/challenge_page.dart';
import 'package:app/challenges/challenges_page.dart';
import 'package:app/config/custom_colors.dart' as colors;
import 'package:app/config/text_styles.dart' as styles;
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Challenge',
        theme: ThemeData.dark().copyWith(
          primaryColor: colors.black,
          accentColor: colors.violet,
          indicatorColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: colors.yellow,
          ),
          primaryTextTheme: TextTheme(
            bodyText1: styles.bodyText1,
            bodyText2: styles.bodyText2,
          ),
        ),
        initialRoute: 'challenges',
        routes: {
          'challenges': (context) => ChallengesPage(),
          'challenge': (context) => ChallengePage(),
        },
      );
}
