import 'dart:developer' as developer;

/// Prints a colored log to the debug console.
/// You can disable all log prints globally by setting the instance [enabled] to false.
class Log {
  Log._();

  static final instance = Log._();

  bool enabled = true;

  /// Debug log
  static void d(String log, {String? identifier, LogColor color = LogColor.cyan}) {
    instance.log(log, identifier: identifier, color: color);
  }

  static void success(String log, {String? identifier}) {
    instance.log(log, identifier: identifier, color: LogColor.green);
  }

  static void error(String log, {String? identifier}) {
    instance.log(log, identifier: identifier, color: LogColor.red);
  }

  static void warning(String log, {String? identifier}) {
    instance.log(log, identifier: identifier, color: LogColor.yellow);
  }

  String? log(String log, {String? identifier, LogColor color = LogColor.white}) {
    String? output;
    if (enabled) {
      final prefix = identifier != null //
          ? '$identifier: '
          : '';
      output = '${color.code}$prefix$log${LogColor.reset.code}';
      developer.log(output);
    }
    return output;
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
