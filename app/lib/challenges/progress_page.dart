import 'package:app/models/challenge.dart';
import 'package:flutter/material.dart';

class ProgressPage extends StatelessWidget {
  final Challenge challenge;

  const ProgressPage(this.challenge);

  @override
  Widget build(BuildContext context) => Container(
        child: Text('Progress'),
      );
}
