import 'package:app/challenges/challenge_page.dart';
import 'package:app/resources/firebase_repository.dart';
import 'package:app/screens/login_screen.dart';
import 'package:app/success/success_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/config/custom_colors.dart' as colors;
import 'package:app/config/text_styles.dart' as styles;
import 'challenges/challenges_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _repository = FirebaseRepository.instance;

  @override
  Widget build(BuildContext context) => MaterialApp(
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
        debugShowCheckedModeBanner: false,
        initialRoute: 'challenges',
        routes: {
          'login': (context) => LoginScreen(),
          'challenges': (context) => buildWidget(() => ChallengesPage()),
          'challenge': (context) => buildWidget(() => ChallengePage()),
          'success': (context) => buildWidget(() => SuccessPage()),
        },
      );

  FutureBuilder<FirebaseUser> buildWidget(Widget Function() widget) =>
      FutureBuilder(
        future: _repository.getCurrentUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return widget();
          } else {
            return LoginScreen();
          }
        },
      );
}
