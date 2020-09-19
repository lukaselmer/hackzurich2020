import 'package:app/models/challenge.dart';
import 'package:flutter/material.dart';

class JoinPage extends StatelessWidget {
  final Challenge challenge;

  const JoinPage(this.challenge);

  @override
  Widget build(BuildContext context) {
    final challenge = ModalRoute.of(context).settings.arguments as Challenge;
    return buildJoin(challenge);
  }

  Widget buildJoin(Challenge challenge) {
    if (challenge.ended) {
      return createWidgetFinished(challenge.challengeName);
    }
    Widget rootContainer = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'You would like to join ?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Im sure there is a way',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );
    return rootContainer;
  }

  Container createWidgetFinished(String challengeName) => Container(
      padding: const EdgeInsets.all(64),
      child: Text(
        'Sorry the activity $challengeName is already finished',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
}