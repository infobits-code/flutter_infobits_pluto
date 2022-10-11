import 'dart:collection';

import '../pluto_log_output.dart';
import 'pluto_log_output.dart';

/// Buffers [OutputEvent]s.
class PlutoMemoryOutput extends PlutoLogOutput {
  /// Maximum events in [buffer].
  final int bufferSize;

  /// A secondary [PlutoLogOutput] to also received events.
  final PlutoLogOutput? secondOutput;

  /// The buffer of events.
  final ListQueue<PlutoOutputLog> buffer;

  PlutoMemoryOutput({this.bufferSize = 20, this.secondOutput})
      : buffer = ListQueue(bufferSize);

  @override
  void output(PlutoOutputLog output) {
    if (buffer.length == bufferSize) {
      buffer.removeFirst();
    }

    buffer.add(output);

    secondOutput?.output(output);
  }
}
