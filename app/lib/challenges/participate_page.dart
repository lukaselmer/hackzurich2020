import 'package:app/models/challenge.dart';
import 'package:flutter/material.dart';

class ParticipatePage extends StatelessWidget {
  final Challenge challenge;

  const ParticipatePage(this.challenge);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Participate'),
    );
  }
}
