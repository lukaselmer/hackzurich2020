import 'package:app/challenges/app_base.dart';
import 'package:app/data/challenges.dart';
import 'package:flutter/material.dart';

class ChallengesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
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
              ListView(
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
                      .toList()),
              ListView(
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
                      .toList()),
              ListView(
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
                      .toList()),
              ListView(
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
                      .toList()),
            ],
          ),
        ),
      ),
    );
  }
}
