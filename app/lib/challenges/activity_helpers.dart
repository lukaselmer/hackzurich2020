import 'package:app/models/activity.dart';
import 'package:flutter/material.dart';

Icon iconFor(Activity activity) {
  final icons = {
    'cycling': Icons.directions_bike,
    'running': Icons.directions_run,
    'swimming': Icons.pool,
  };
  return Icon(icons[activity.sport] ?? Icons.hourglass_empty);
}

Color colorFor(Activity activity) {
  final icons = {
    'cycling': Colors.blue,
    'running': Colors.orange,
    'swimming': Colors.blue,
  };
  return icons[activity.sport] ?? Colors.black;
}
