import 'package:app/challenges/join_page.dart';
import 'package:app/challenges/participate_page.dart';
import 'package:app/challenges/progress_page.dart';
import 'package:app/models/challenge.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final challenge = ModalRoute.of(context).settings.arguments as Challenge;
    return buildChallenge(challenge);
  }

  Widget buildChallenge(Challenge challenge) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(challenge.challengeName),
          bottom: TabBar(
            tabs: [
              // signup, participation, statistics
              Tab(text: 'Join'),
              Tab(text: 'Participate'),
              Tab(text: 'Progress'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            JoinPage(challenge),
            ParticipatePage(challenge),
            ProgressPage(challenge),
          ],
        ),
      ),
    );
  }
}
