import '../pluto_log_output.dart';
import 'pluto_log_output.dart';

/// Default implementation of [PlutoLogOutput].
///
/// It sends everything to the system console.
class PlutoConsoleLogOutput extends PlutoLogOutput {
  const PlutoConsoleLogOutput();

  @override
  void output(PlutoOutputLog output) {
    // ignore: avoid_print
    output.lines.forEach(print);
  }
}
