import '../pluto_log_event.dart';

/// An abstract filter of log messages.
///
/// You can implement your own `LogFilter` or use [DevelopmentFilter].
/// Every implementation should consider [Logger.level].
abstract class PlutoLogFilter {
  final PlutoLogLevel? level;

  const PlutoLogFilter({this.level});

  void init() {}

  /// Is called every time a new log message is sent and decides if
  /// it will be printed or canceled.
  ///
  /// Returns `true` if the message should be logged.
  bool shouldLog(PlutoLogEvent logEvent);

  void destroy() {}
}
