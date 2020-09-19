import 'package:flutter/material.dart';

void navigateTo(
  BuildContext context,
  String routeName, {
  Object arguments,
  bool pop = true,
}) async {
  popAll(context);
  await Navigator.pushNamed(context, routeName, arguments: arguments);
}

void popAll(BuildContext context) {
  while (Navigator.canPop(context)) {
    Navigator.pop(context);
  }
}
