import 'dart:async';

import '../pluto_log_output.dart';
import 'pluto_log_output.dart';

class PlutoStreamLogOutput extends PlutoLogOutput {
  late StreamController<List<String>> _controller;
  bool _shouldForward = false;

  PlutoStreamLogOutput() {
    _controller = StreamController<List<String>>(
      onListen: () => _shouldForward = true,
      onPause: () => _shouldForward = false,
      onResume: () => _shouldForward = true,
      onCancel: () => _shouldForward = false,
    );
  }

  Stream<List<String>> get stream => _controller.stream;

  @override
  void output(PlutoOutputLog output) {
    if (!_shouldForward) {
      return;
    }

    _controller.add(output.lines);
  }

  @override
  void destroy() {
    _controller.close();
  }
}
