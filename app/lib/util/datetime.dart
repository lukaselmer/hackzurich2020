String formatHourAndMinute(DateTime starting) =>
    '${_twoDigits(starting.hour)}:${_twoDigits(starting.minute)}';

String _twoDigits(int n) {
  if (n >= 10) return "$n";
  return "0$n";
}
