
class Format {
  static const Duration _vietnamOffset = Duration(hours: 7);

  static String formatDMY(DateTime? date) {
    if (date == null) return '';
    final localDate = normalizeDate(date);
    return '${localDate.day.toString().padLeft(2, '0')}/'
        '${localDate.month.toString().padLeft(2, '0')}/'
        '${localDate.year}';
  }

  static String formatDate(DateTime date) {
    return normalizeDate(date).toIso8601String().split('T')[0];
  }

  static DateTime normalizeDate(DateTime? value) {
    final date = (value ?? DateTime.now()).toUtc().add(_vietnamOffset);
    return DateTime(date.year, date.month, date.day);
  }

  static String formatYMD(DateTime? date) {
    if (date == null) return '';
    return '${date.year.toString().padLeft(4, '0')}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.day.toString().padLeft(2,'0')}';
  }
}
