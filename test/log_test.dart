import 'package:flutter_test/flutter_test.dart';

import 'package:dart_tools/log.dart';

void main() {
  const printMessage = 'log is not printed';

  test('log is printed', () {
    final result = Log.instance.log(printMessage, color: LogColor.cyan);
    expect(result, '${LogColor.cyan.code}$printMessage${LogColor.reset.code}');
  });

  test('log is disabled', () {
    Log.instance.enabled = false;
    final result = Log.instance.log(printMessage, color: LogColor.cyan);
    expect(result, isNull);
  });

  test('log is still disabled', () {
    final result = Log.instance.log(printMessage, color: LogColor.cyan);
    expect(result, isNull);
  });

  test('log has identifier', () {
    const id = 'Test';
    Log.instance.enabled = true;

    final result = Log.instance.log(
      printMessage,
      color: LogColor.cyan,
      identifier: id,
    );

    expect(result, '${LogColor.cyan.code}$id: $printMessage${LogColor.reset.code}');
  });
}
