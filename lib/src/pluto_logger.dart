import 'pluto.dart';
import 'pluto_log_event.dart';

/// The class for logging to the Pluto Service
class PlutoLogger {
  /// Log at verbose level
  ///
  /// [message] A descriptive message
  static void verbose(dynamic message) {
    Pluto.instance.recordLog(PlutoLogLevel.verbose, message);
  }

  /// Log at debug level
  ///
  /// [message] A descriptive message
  static void debug(dynamic message) {
    Pluto.instance.recordLog(PlutoLogLevel.debug, message);
  }

  /// Log at info level
  ///
  /// [message] A descriptive message
  static void info(dynamic message) {
    Pluto.instance.recordLog(PlutoLogLevel.info, message);
  }

  /// Log at warn level
  ///
  /// [message] A descriptive message
  static void warn(dynamic message) {
    Pluto.instance.recordLog(PlutoLogLevel.warning, message);
  }

  /// Log at error level
  ///
  /// [message] A descriptive message
  static void error(dynamic message) {
    Pluto.instance.recordLog(PlutoLogLevel.error, message);
  }

  /// Log at fatal level
  ///
  /// [message] A descriptive message
  static void fatal(dynamic message) {
    Pluto.instance.recordLog(PlutoLogLevel.fatal, message);
  }
}
