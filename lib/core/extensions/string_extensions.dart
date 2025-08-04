import 'package:cred_connect/core/core.dart';

extension StringExtension on String {
  DateTime toDateTimeOrThrow() {
    try {
      final parts = split('/');

      if (parts.length != 3) {
        throw FormatException();
      }

      final year = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final day = int.parse(parts[2]);

      return DateTime(year, month, day);
    } catch (_) {
      throw SystemException(
        title: 'Invalid date format',
        message:
            'The provided date "$this" is not in the format yyyy/MM/dd or is invalid.',
      );
    }
  }
}
