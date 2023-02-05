import 'dart:async';
import 'dart:developer' as developer;

/// Prints a colored log to the debug console.
/// You can disable all log prints globally by setting the instance [enabled] to false.
class Log {
  Log._();

  static final instance = Log._();

  bool enabled = true;

  /// Debug log
  static void d(
    String message, {
    DateTime? time,
    int? sequenceNumber,
    int level = 0,
    String name = '',
    Zone? zone,
    Object? error,
    StackTrace? stackTrace,
    LogColor color = LogColor.cyan,
  }) {
    instance.log(
      message,
      time: time,
      sequenceNumber: sequenceNumber,
      level: level,
      name: name,
      zone: zone,
      error: error,
      stackTrace: stackTrace,
      color: color,
    );
  }

  static void success(
    String message, {
    DateTime? time,
    int? sequenceNumber,
    int level = 0,
    String name = '',
    Zone? zone,
    Object? error,
    StackTrace? stackTrace,
  }) {
    instance.log(
      message,
      time: time,
      sequenceNumber: sequenceNumber,
      level: level,
      name: name,
      zone: zone,
      error: error,
      stackTrace: stackTrace,
      color: LogColor.green,
    );
  }

  static void error(
    String message, {
    DateTime? time,
    int? sequenceNumber,
    int level = 0,
    String name = '',
    Zone? zone,
    Object? error,
    StackTrace? stackTrace,
  }) {
    instance.log(
      message,
      time: time,
      sequenceNumber: sequenceNumber,
      level: level,
      name: name,
      zone: zone,
      error: error,
      stackTrace: stackTrace,
      color: LogColor.red,
    );
  }

  static void warning(
    String message, {
    DateTime? time,
    int? sequenceNumber,
    int level = 0,
    String name = '',
    Zone? zone,
    Object? error,
    StackTrace? stackTrace,
  }) {
    instance.log(
      message,
      time: time,
      sequenceNumber: sequenceNumber,
      level: level,
      name: name,
      zone: zone,
      error: error,
      stackTrace: stackTrace,
      color: LogColor.yellow,
    );
  }

  void log(
    String message, {
    DateTime? time,
    int? sequenceNumber,
    int level = 0,
    String name = '',
    Zone? zone,
    Object? error,
    StackTrace? stackTrace,
    LogColor color = LogColor.white,
  }) {
    if (enabled) {
      developer.log(
        '${color.code}$message${LogColor.reset.code}',
        name: name,
      );
    }
  }
}

enum LogColor {
  reset('\x1B[0m'),
  black('\x1B[30m'),
  red('\x1B[31m'),
  green('\x1B[32m'),
  yellow('\x1B[33m'),
  blue('\x1B[34m'),
  cyan('\x1B[36m'),
  white('\x1B[37m');

  const LogColor(this.code);

  final String code;
}
