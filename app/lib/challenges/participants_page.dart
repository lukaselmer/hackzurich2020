import 'package:app/models/activity.dart';
import 'package:app/models/challenge.dart';
import 'package:app/util/datetime.dart';
import 'package:flutter/material.dart';
import 'package:duration/duration.dart';

class ParticipantsPage extends StatelessWidget {
  final Challenge challenge;

  const ParticipantsPage(this.challenge);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: challenge.activities
          .map<Widget>(
            (activity) => ListTile(
              key: Key(activity.id),
              leading: _iconFor(activity),
              title: Text(activity.user.name),
              subtitle: Text(formatSubtitle(activity)),
            ),
          )
          .toList(),
    );
  }

  String formatSubtitle(Activity activity) {
    final hoursAndMinutes = formatHourAndMinute(activity.startingAt);
    final diff = activity.startingAt.difference(DateTime.now());
    final activityIn = printDuration(
      diff.abs(),
      abbreviated: true,
      tersity: DurationTersity.minute,
    );
    final inPast = diff.isNegative;

    if (activity.startingAt.isAfter(DateTime.now())) {
      return 'Starting at $hoursAndMinutes, in $activityIn';
    }
  }
}

Icon _iconFor(Activity activity) {
  final icons = {
    'cycling': Icons.directions_bike,
    'running': Icons.directions_run,
    'swimming': Icons.pool,
  };
  return Icon(icons[activity.sport] ?? Icons.hourglass_empty);
}
