import 'package:app/challenges/app_base.dart';
import 'package:app/data/challenges.dart';
import 'package:flutter/material.dart';

class ChallengesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBase(ListView(
      children: challenges()
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
          .toList(),
    ));
  }
}
