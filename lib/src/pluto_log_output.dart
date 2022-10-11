import 'pluto_log_event.dart';

class PlutoOutputLog {
  final PlutoLogLevel level;
  final List<String> lines;

  PlutoOutputLog(this.level, this.lines);
}
