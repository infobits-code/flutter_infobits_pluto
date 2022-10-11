import '../pluto_log_output.dart';

/// Log output receives a [PlutoOutputLog] from [LogPrinter] and sends it to the
/// desired destination.
///
/// This can be an output stream, a file or a network target. [PlutoLogOutput] may
/// cache multiple log messages.
abstract class PlutoLogOutput {
  const PlutoLogOutput();

  void init() {}

  void output(PlutoOutputLog output);

  void destroy() {}
}
