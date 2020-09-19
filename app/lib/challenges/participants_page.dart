import 'package:app/models/activity.dart';
import 'package:app/models/challenge.dart';
import 'package:flutter/material.dart';

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
              subtitle: Text(activity.startingAt.toIso8601String()),
            ),
          )
          .toList(),
    );
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
