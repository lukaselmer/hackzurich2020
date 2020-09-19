import 'package:app/challenges/participants_page.dart';
import 'package:app/challenges/progress/wall_page.dart';
import 'package:app/challenges/progress_page.dart';
import 'package:app/data/challenges.dart';
import 'package:app/models/challenge.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final challenge = ModalRoute.of(context).settings.arguments as Challenge;
    return buildChallenge(challenge);
  }

  Widget buildChallenge(Challenge challenge) {
    var tabs = [
      Tab(text: 'PROGRESS'),
      Tab(text: 'PARTICIPANTS'),
      Tab(text: 'CHAT'),
    ];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(challenge?.challengeName ?? 'Unknown Challenge'),
          bottom: TabBar(tabs: tabs),
        ),
        body: TabBarView(
          children: [
            ProgressPage(challenge),
            ParticipantsPage(challenge),
            Expanded(child: WallPage(challenge, users)),
          ],
        ),
      ),
    );
  }
}
