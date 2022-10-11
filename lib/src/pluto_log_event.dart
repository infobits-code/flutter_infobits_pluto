import 'pluto_trace.dart';
import 'utils.dart';

enum PlutoLogLevel { verbose, debug, info, warning, error, fatal }

class PlutoLogEvent {
  final PlutoLogLevel level;
  final dynamic message;
  final dynamic exception;
  final String? information;
  final List<PlutoTrace>? stackTrace;
  final DateTime loggedAt = DateTime.now();

  PlutoLogEvent({
    required this.level,
    required this.message,
    required this.exception,
    required this.information,
    required this.stackTrace,
  });
}
