import '../pluto_log_output.dart';
import 'pluto_log_output.dart';

/// Logs simultaneously to multiple [PlutoLogOutput] outputs.
class MultiOutput extends PlutoLogOutput {
  late List<PlutoLogOutput> _outputs;

  MultiOutput(List<PlutoLogOutput?>? outputs) {
    _outputs = _normalizeOutputs(outputs);
  }
  List<PlutoLogOutput> _normalizeOutputs(List<PlutoLogOutput?>? outputs) {
    final normalizedOutputs = <PlutoLogOutput>[];

    if (outputs != null) {
      for (final output in outputs) {
        if (output != null) {
          normalizedOutputs.add(output);
        }
      }
    }

    return normalizedOutputs;
  }

  @override
  void init() {
    _outputs.forEach((o) => o.init());
  }

  @override
  void output(PlutoOutputLog output) {
    _outputs.forEach((o) => o.output(output));
  }

  @override
  void destroy() {
    _outputs.forEach((o) => o.destroy());
  }
}
