import 'package:app/challenges/app_base.dart';
import 'package:app/models/challenge.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    final challenge = args as Challenge;

    return AppBase(Container(
      child: Text(challenge.challengeName),
    ));
  }
}
