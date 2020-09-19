import 'package:app/models/challenge.dart';
import 'package:app/models/user.dart';
import 'package:flutter/material.dart';

class WallPage extends StatelessWidget {
  final Challenge challenge;
  final List<User> users;

  WallPage(this.challenge, this.users);

  @override
  Widget build(BuildContext context) => ListView(
      children: challenge.comments
          .map<Widget>(
            (comment) => Container(
              child: ListTile(
                key: Key(comment.id),
                // leading: _iconFor(activity),
                title: Text(comment.text),
                subtitle: Text('written by ${comment.user_id}'),
              ),
            ),
          )
          .toList());
}
