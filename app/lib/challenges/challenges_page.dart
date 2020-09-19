import 'package:app/challenges/challenges_filter.dart';
import 'package:app/models/challenge.dart';
import 'package:app/util/datetime.dart';
import 'package:duration/duration.dart';
import 'package:flutter/material.dart';

class ChallengesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => DefaultTabController(
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
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Fake button to add new challenge
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.cyan,
          ),
        ),
      );

  Widget buildChallenges(BuildContext context, List<Challenge> challenges) {
    if (challenges.isEmpty) return Text('');

    return ListView(
      children: challenges
          .map<Widget>(
            (challenge) => ListTile(
              key: Key(challenge.id),
              title: Text(challenge.challengeName),
              subtitle: Text(challenge.teamName),
              trailing: Text(formatTrailing(challenge)),
              onTap: () => Navigator.pushNamed(
                context,
                'challenge',
                arguments: challenge,
              ),
            ),
          )
          .toList(),
    );
  }
}

String formatTrailing(Challenge challenge) {
  if (!challenge.started) {
    final diff = printDuration(
      DateTime.now().difference(challenge.startsAt).abs(),
      abbreviated: true,
      tersity: DurationTersity.hour,
    );
    return 'Starts in $diff';
  }
  if (!challenge.running) {
    final diff = printDuration(
      DateTime.now().difference(challenge.endsAt).abs(),
      abbreviated: true,
      tersity: DurationTersity.hour,
    );
    return 'Running, ends in $diff';
  }

  return 'Ended at ${formatHourAndMinute(challenge.endsAt)}';
}
