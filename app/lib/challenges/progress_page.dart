import 'package:app/challenges/progress/activity_page.dart';
import 'package:app/challenges/progress/progress_details_page.dart';
import 'package:app/data/challenges.dart';
import 'package:app/data/users.dart';
import 'package:app/models/challenge.dart';
import 'package:flutter/material.dart';

class ProgressPage extends StatelessWidget {
  final Challenge challenge;

  const ProgressPage(this.challenge);

  @override
  Widget build(BuildContext context) {
    final activity = activityReadyToStart(currentUser, challenge);
    return Container(
      child: Column(
        children: [
          if (activity != null)
            Expanded(
              child: ActivityPage(challenge, activity),
              flex: 2,
            ),
          Expanded(
            child: ProgressDetailsPage(challenge),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
