import 'package:app/challenges/app_base.dart';
import 'package:app/data/challenges.dart';
import 'package:app/models/challenge.dart';
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
                  .where((element) => (DateTime.now().isAfter(element.startingAt )))
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
              if (buildList(context, challenges).isNotEmpty)
                ListView(children: buildList(context, challenges)),
              ListView(
                  children: challenges
                      .where((element) => (DateTime.now().isBefore(element.startingAt )))
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

  List<Widget> buildList(BuildContext context, List<Challenge> challenges) {
    return challenges
                    .where((element) => (DateTime.now().isAfter(element.startingAt ) && DateTime.now().isBefore(element.startingAt.add(element.totalDuration))))
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
                    .toList();
  }
}
