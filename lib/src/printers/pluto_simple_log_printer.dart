import 'dart:convert';

import '../ansi_color.dart';
import '../pluto_log_event.dart';
import 'pluto_log_printer.dart';

/// Outputs simple log messages:
/// ```
/// [ERROR] Log message  ERROR: Error info
/// ```
class PlutoSimpleLogPrinter extends PlutoLogPrinter {
  static final levelPrefixes = {
    PlutoLogLevel.verbose: '[VERBOSE]',
    PlutoLogLevel.debug: '[DEBUG]',
    PlutoLogLevel.info: '[INFO]',
    PlutoLogLevel.warning: '[WARNING]',
    PlutoLogLevel.error: '[ERROR]',
    PlutoLogLevel.fatal: '[FATAL]',
  };

  static final levelColors = {
    PlutoLogLevel.verbose: AnsiColor.fg(AnsiColor.grey(0.5)),
    PlutoLogLevel.debug: AnsiColor.fg(null),
    PlutoLogLevel.info: AnsiColor.fg(12),
    PlutoLogLevel.warning: AnsiColor.fg(208),
    PlutoLogLevel.error: AnsiColor.fg(196),
    PlutoLogLevel.fatal: AnsiColor.fg(199),
  };

  final bool printTime;
  final bool colors;

  const PlutoSimpleLogPrinter({this.printTime = false, this.colors = true});

  @override
  List<String> log(PlutoLogEvent logEvent) {
    var errorStr =
        logEvent.exception != "" ? '  ERROR: ${logEvent.exception}' : '';
    var timeStr = printTime ? 'TIME: ${DateTime.now().toIso8601String()}' : '';
    return [
      '${_labelFor(logEvent.level)} $timeStr ${logEvent.message}$errorStr'
    ];
  }

  String _labelFor(PlutoLogLevel level) {
    var prefix = levelPrefixes[level]!;
    var color = levelColors[level]!;

    return colors ? color(prefix) : prefix;
  }
}
