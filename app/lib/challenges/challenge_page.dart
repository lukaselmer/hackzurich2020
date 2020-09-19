import 'package:app/challenges/join_page.dart';
import 'package:app/challenges/participants_page.dart';
import 'package:app/challenges/progress_page.dart';
import 'package:app/models/challenge.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final challenge = ModalRoute.of(context).settings.arguments as Challenge;
    return buildChallenge(challenge);
  }

  Widget buildChallenge(Challenge challenge) => DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(challenge.challengeName),
            bottom: TabBar(
              tabs: [
                Tab(text: 'PROGRESS'),
                Tab(text: 'PARTICIPANTS'),
                Tab(text: 'JOIN'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ProgressPage(challenge),
              ParticipantsPage(challenge),
              JoinPage(challenge),
            ],
          ),
        ),
      );
}
