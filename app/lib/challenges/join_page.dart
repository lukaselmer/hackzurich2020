import 'package:app/models/challenge.dart';
import 'package:flutter/material.dart';

class JoinPage extends StatelessWidget {
  final Challenge challenge;

  const JoinPage(this.challenge);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Join'),
    );
  }
}
