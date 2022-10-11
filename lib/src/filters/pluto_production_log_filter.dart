import '../pluto_log_event.dart';
import 'pluto_log_filter.dart';

/// Prints all logs with `level >= Logger.level` even in production.
class PlutoProductionLogFilter extends PlutoLogFilter {
  const PlutoProductionLogFilter({super.level = PlutoLogLevel.info});

  @override
  bool shouldLog(PlutoLogEvent logEvent) {
    return logEvent.level.index >= level!.index;
  }
}
