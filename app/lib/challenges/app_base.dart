import 'package:flutter/material.dart';

class AppBase extends StatelessWidget {
  final Widget child;

  AppBase(this.child);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Challenge')),
        body: child,
      );
}
