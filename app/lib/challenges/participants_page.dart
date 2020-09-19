import 'package:app/challenges/activity_helpers.dart';
import 'package:app/models/activity.dart';
import 'package:app/models/challenge.dart';
import 'package:app/util/datetime.dart';
import 'package:flutter/material.dart';
import 'package:duration/duration.dart';

class ParticipantsPage extends StatelessWidget {
  final Challenge challenge;

  const ParticipantsPage(this.challenge);

  @override
  Widget build(BuildContext context) => ListView(
        children: challenge.activities
            .map<Widget>(
              (activity) => Container(
                decoration:
                    activity.running ? BoxDecoration(color: Colors.grey) : null,
                child: ListTile(
                  key: Key(activity.id),
                  leading: iconFor(activity),
                  title: Text(activity.user.name),
                  subtitle: Text(_formatSubtitle(activity)),
                ),
              ),
            )
            .toList(),
      );
}

String _formatSubtitle(Activity activity) {
  final hoursAndMinutes = formatHourAndMinute(activity.startsAt);

  if (!activity.started) {
    final diff = activity.startsAt.difference(DateTime.now());
    return 'Starting at $hoursAndMinutes, in ${_formatDiff(diff)}';
  }
  if (activity.running) {
    final diff = activity.endsAt.difference(DateTime.now());
    return 'Currently sweating! Ends in ${_formatDiff(diff)}';
  }
  return 'Done';
}

String _formatDiff(Duration diff) => printDuration(
      diff.abs(),
      abbreviated: true,
      tersity: DurationTersity.minute,
    );
