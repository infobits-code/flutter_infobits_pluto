import '../pluto_log_event.dart';

/// An abstract handler of log events.
///
/// A log printer creates and formats the output, which is then sent to
/// [PlutoOutputLog].
///
/// You can implement a `PlutoLogPrinter` from scratch or extend [PlutoPrettyLogPrinter].
abstract class PlutoLogPrinter {
  const PlutoLogPrinter();

  void init() {}

  /// Is called every time a new [PlutoLogEvent] is sent and handles printing or
  /// storing the message.
  List<String> log(PlutoLogEvent logEvent);

  void destroy() {}
}
