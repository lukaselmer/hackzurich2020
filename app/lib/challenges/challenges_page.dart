import 'package:app/challenges/challenges_filter.dart';
import 'package:app/models/challenge.dart';
import 'package:flutter/material.dart';

class ChallengesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: 'Upcoming'),
              Tab(text: 'Current'),
              Tab(text: 'Past'),
              Tab(text: 'Mine'),
            ],
          ),
          title: Text('Challenges'),
        ),
        body: TabBarView(
          children: [
            buildChallenges(context, upcomingChallenges()),
            buildChallenges(context, currentChallenges()),
            buildChallenges(context, pastChallenges()),
            buildChallenges(context, myChallenges()),
          ],
        ),
      ),
    );
  }

  Widget buildChallenges(BuildContext context, List<Challenge> challenges) {
    if (challenges.isEmpty) return Text('');

    return ListView(
        children: challenges
            .map<Widget>(
              (challenge) => ListTile(
                key: Key(challenge.id),
                title: Text(challenge.challengeName),
                onTap: () => Navigator.pushNamed(
                  context,
                  'challenge',
                  arguments: challenge,
                ),
              ),
            )
            .toList());
  }
}
