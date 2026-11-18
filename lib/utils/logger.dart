import 'package:flutter/foundation.dart';

/// Utilitas logging terstruktur yang hanya aktif pada mode debug ([kDebugMode]).
///
/// Dirancang agar tidak mencatat informasi sensitif seperti token atau API key.
class Logger {
  static void _log(String level, String message) {
    if (kDebugMode) {
      final timestamp = DateTime.now().toIso8601String();
      debugPrint('[$timestamp] [$level] $message');
    }
  }

  /// Mencatat pesan tingkat debug untuk pelacakan pengembangan.
  static void debug(String message) => _log('DEBUG', message);

  /// Mencatat informasi alur normal aplikasi.
  static void info(String message) => _log('INFO', message);

  /// Mencatat peringatan non-fatal.
  static void warning(String message) => _log('WARNING', message);

  /// Mencatat pesan kesalahan aplikasi.
  static void error(String message, [Object? error]) {
    _log('ERROR', error != null ? '$message | Detail: $error' : message);
  }
}