import '../pluto_log_event.dart';
import 'pluto_log_filter.dart';

/// Prints all logs with `level >= Logger.level` while in development mode (eg
/// when `assert`s are evaluated, Flutter calls this debug mode).
///
/// In release mode ALL logs are omitted.
class PlutoDevelopmentLogFilter extends PlutoLogFilter {
  const PlutoDevelopmentLogFilter({super.level = PlutoLogLevel.verbose});

  @override
  bool shouldLog(PlutoLogEvent logEvent) {
    var shouldLog = false;
    assert(() {
      if (logEvent.level.index >= level!.index) {
        shouldLog = true;
      }
      return true;
    }());
    return shouldLog;
  }
}
