
class Format {
  static String formatDMY(DateTime? date) {
    if (date == null) return '';
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  static String formatDate(DateTime date) {
    return date.toIso8601String().split('T')[0];
  }

  static DateTime normalizeDate(DateTime? value) {
    final date = value ?? DateTime.now();
    return DateTime(date.year, date.month, date.day);
  }

  static String formatYMD(DateTime? date) {
    if (date == null) return '';
    return '${date.year.toString().padLeft(4, '0')}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.day.toString().padLeft(2,'0')}';
  }
}
