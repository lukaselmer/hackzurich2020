import 'package:app/challenges/challenges_filter.dart';
import 'package:app/models/challenge.dart';
import 'package:app/resources/fbRepo.dart';
import 'package:app/screens/loginScreen.dart';
import 'package:app/util/datetime.dart';
import 'package:duration/duration.dart';
import 'package:flutter/material.dart';

class ChallengesPage extends StatelessWidget {
  @override
  FirebaseRepository _repository = FirebaseRepository();

  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: 'CURRENT'),
                Tab(text: 'PAST'),
                Tab(text: 'MINE'),
              ],
            ),
            title: Text('Challenges'),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
                onPressed: () {
                  _repository.signOut();
                  Navigator.push<MaterialPageRoute>(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
          body: TabBarView(
            children: [
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
  if (challenge.running) {
    final diff = printDuration(
      DateTime.now().difference(challenge.endsAt).abs(),
      abbreviated: true,
      tersity: DurationTersity.hour,
    );
    return 'Running, ends in $diff';
  }

  return 'Ended at ${formatHourAndMinute(challenge.endsAt)}';
}
