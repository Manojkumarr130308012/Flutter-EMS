// To check if the item is contained in a list
bool isNotContained<T>(List<T> list, T item) {
  return !list.contains(item);
}

/////////////////////////// DURATION FORMAT METHOD \\\\\\\\\\\\\\\\\\\\\\\\\\
// USED IN TIMER
String formatDuration(Duration duration) {
  return '${duration.inHours.remainder(60).toString().padLeft(2, '0')}:'
      '${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:'
      '${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}';
}
