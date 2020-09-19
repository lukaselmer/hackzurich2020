import 'package:app/resources/fbRepo.dart';
import 'package:app/screens/loginScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/config/custom_colors.dart' as colors;
import 'package:app/config/text_styles.dart' as styles;
import 'challenges/challenge_page.dart';
import 'challenges/challenges_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseRepository _repository = FirebaseRepository();

  @override
  Widget build(BuildContext context) {
    //_repository.signOut();

    return MaterialApp(
      title: "Challenge",
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
      home: FutureBuilder(
        future: _repository.getCurrentUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.hasData) {
            return ChallengesPage();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
