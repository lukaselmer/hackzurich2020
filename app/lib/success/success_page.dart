import 'package:app/models/challenge.dart';
import 'package:flutter/material.dart';
import 'package:simple_gravatar/simple_gravatar.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final challenge = ModalRoute.of(context).settings.arguments as Challenge;
    final stats = challenge.activities.fold<Map<String, double>>(
      <String, double>{},
      (map, element) => map
        ..putIfAbsent(element.sport, () => 0)
        ..[element.sport] += element.kmMoved,
    );
    final names = challenge.activities.map((el) => el.user.name).join(', ');
    final emails = challenge.activities.map((el) => el.user.email);
    final gravatars = emails.map(
      (email) => Gravatar(email).imageUrl(size: 100),
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              challenge.challengeName,
              style: TextStyle(fontSize: 40),
            ),
            Text(
              '🎉',
              style: TextStyle(fontSize: 180),
            ),
            Text(' '),
            Text(
              names,
              style: TextStyle(fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: gravatars
                    .map(
                      (url) => ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(url),
                      ),
                    )
                    .toList(),
              ),
            ),
            ...stats.entries.map((el) => Text(
                  '${el.value} km ${el.key}',
                  style: TextStyle(fontSize: 25),
                )),
            Text(' '),
            Text(
              '💪💪💪',
              style: TextStyle(fontSize: 80),
            ),
          ],
        ),
      ),
    );
  }
}
