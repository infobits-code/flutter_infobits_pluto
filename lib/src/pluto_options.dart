import 'package:flutter/widgets.dart';

import '../infobits_pluto.dart';
import 'error_rendering/pluto_error_widget.dart';

typedef ErrorWidgetBuilder = Widget Function(FlutterErrorDetails details);

class PlutoOptions {
  final ErrorWidgetBuilder? widgetErrorBuilder;
  final PlutoLogFilter filter;
  final PlutoLogPrinter printer;
  final PlutoLogOutput output;

  PlutoOptions({
    this.widgetErrorBuilder,
    this.filter = const PlutoDevelopmentLogFilter(),
    this.printer = const PlutoPrettyLogPrinter(),
    this.output = const PlutoConsoleLogOutput(),
  });

  // The default error widget builder
  static ErrorWidgetBuilder defaultErrorBuilder = (errorDetails) {
    String message = '';
    assert(() {
      message =
          '${errorDetails.exception.toString()}\nSee also: https://flutter.dev/docs/testing/errors';
      return true;
    }());
    final Object exception = errorDetails.exception;
    return PlutoErrorWidget.withDetails(
        message: message, error: exception is FlutterError ? exception : null);
  };
}
