import 'dart:convert';
import 'dart:io';

import '../pluto_log_output.dart';
import 'pluto_log_output.dart';

class PlutoFileLogOutput extends PlutoLogOutput {
  final File file;
  final bool overrideExisting;
  final Encoding encoding;
  IOSink? _sink;

  PlutoFileLogOutput({
    required this.file,
    this.overrideExisting = false,
    this.encoding = utf8,
  });

  @override
  void init() {
    _sink = file.openWrite(
      mode: overrideExisting ? FileMode.writeOnly : FileMode.writeOnlyAppend,
      encoding: encoding,
    );
  }

  @override
  void output(PlutoOutputLog output) {
    _sink?.writeAll(output.lines, '\n');
    _sink?.writeln();
  }

  @override
  void destroy() async {
    await _sink?.flush();
    await _sink?.close();
  }
}
