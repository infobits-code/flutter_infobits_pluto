class PlutoTrace {
  String file;
  String? className;
  String? method;
  int? line;
  int? column;

  PlutoTrace({
    required this.file,
    this.className,
    this.method,
    this.line,
    this.column,
  });
}
