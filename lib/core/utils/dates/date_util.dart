// ignore_for_file: lines_longer_than_80_chars

class DateUtil {
  String? hourAndMinute({required DateTime? dateTime}) {
    if (dateTime == null) {
      return null;
    } else {
      final value =
          '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
      return value;
    }
  }
}
