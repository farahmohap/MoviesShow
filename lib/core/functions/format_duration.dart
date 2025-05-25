 String formatDuration(int totalMinutes) {
    if (totalMinutes < 1) return '0m';
    final hours = totalMinutes ~/ 60;
    final minutes = totalMinutes % 60;

    if (hours == 0) return '${minutes}m';
    if (minutes == 0) return '${hours}h';

    return '${hours}h ${minutes}m';
  }
