import 'package:app/models/challenge.dart';
import 'package:app/models/user.dart';
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
    final users = challenge.activities.map((activity) => activity.user);

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
            Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: users
                    .map(
                      (user) => Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.network(_gravatar(user)),
                          ),
                          Text(' ', style: TextStyle(fontSize: 8)),
                          Text(user.name, style: TextStyle(fontSize: 20)),
                          Text(' ', style: TextStyle(fontSize: 8)),
                          Text('🏅', style: TextStyle(fontSize: 60)),
                          Text(' ', style: TextStyle(fontSize: 8)),
                        ],
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
          ],
        ),
      ),
    );
  }
}

String _gravatar(User user) => Gravatar(user.email).imageUrl(size: 100);
