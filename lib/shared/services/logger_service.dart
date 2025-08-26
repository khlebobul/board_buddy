import 'package:talker/talker.dart';

/// Global Talker instance for app-wide logging
Talker? _talkerInstance;

/// Logger service for app-wide logging
class LoggerService {
  /// Get the Talker instance
  static Talker get talker {
    if (_talkerInstance == null) {
      throw Exception(
          'Talker not initialized. Call LoggerService.initialize() first.');
    }
    return _talkerInstance!;
  }

  /// Initialize the Talker instance
  static void initialize(Talker talker) {
    _talkerInstance = talker;
  }

  /// Log info message
  static void info(String message) {
    talker.info(message);
  }

  /// Log debug message
  static void debug(String message) {
    talker.debug(message);
  }

  /// Log error message with optional stack trace
  static void error(dynamic error, [StackTrace? stackTrace]) {
    talker.error(error, stackTrace);
  }

  /// Log warning message
  static void warning(String message) {
    talker.warning(message);
  }

  /// Log success message
  static void success(String message) {
    talker.info('[SUCCESS] $message');
  }
}
