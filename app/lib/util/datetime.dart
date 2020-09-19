String formatHourAndMinute(DateTime date) =>
    '${_twoDigits(date.hour)}:${_twoDigits(date.minute)}';

String _twoDigits(int n) {
  if (n >= 10) return '$n';
  return '0$n';
}
