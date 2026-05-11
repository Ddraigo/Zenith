
import 'package:intl/intl.dart';

class Format {

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
  final local = (value ?? DateTime.now()).toLocal();
  return DateTime(local.year, local.month, local.day);
}

  static String formatYMD(DateTime? date) {
    if (date == null) return '';
    return '${date.year.toString().padLeft(4, '0')}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.day.toString().padLeft(2,'0')}';
  }

  static String formatDM(DateTime? date){
    if (date == null) return '';
    return 
        '${date.day.toString().padLeft(2,'0')} tháng '
        '${date.month.toString().padLeft(2, '0')}';
  }

  static String dayOfWeek(DateTime? date){
    if (date == null) return '';
    final dayOfWeek = DateFormat.EEEE().format(date).toLowerCase();
    switch (dayOfWeek) {
      case 'monday':
        return 'Thứ hai';
      case 'tuesday':
        return 'Thứ ba';
      case 'wednesday':
        return 'Thứ tư';
      case 'thursday':
        return 'Thứ năm';
      case 'friday':
        return 'Thứ sáu';
      case 'saturday':
        return 'Thứ bảy';
      case 'sunday':
        return 'Chủ nhật';
       
      default:
    }
    return dayOfWeek;
  }

  static Map<String, dynamic> asMap(dynamic value) {
    if (value is Map<String, dynamic>) return value;
    if (value is Map) return Map<String, dynamic>.from(value);
    return const <String, dynamic>{};
  }

  static String asString(dynamic value) {
    return value == null ? '' : value.toString().trim();
  }

  static List<String> asStringList(dynamic value) {
    if (value is! List) return const <String>[];
    return value
        .map((e) => asString(e))
        .where((e) => e.isNotEmpty)
        .toList(growable: false);
  }
}
