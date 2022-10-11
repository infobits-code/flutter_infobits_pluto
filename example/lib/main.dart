import 'package:flutter/material.dart';
import 'package:infobits_pluto/infobits_pluto.dart';

void main() async {
  await Pluto.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void throwError() {
    throw Exception("This is a test exception");
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example of Pluto',
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Test the Pluto Logging Tool"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => PlutoLogger.verbose("Test verbose"),
                    child: const Text("Test verbose log"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => PlutoLogger.debug("Test debug"),
                    child: const Text("Test debug log"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => debugPrint("Test debug from debugPrint"),
                    child: const Text("Test debug from debugPrint"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => PlutoLogger.info("Test info"),
                    child: const Text("Test info log"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => PlutoLogger.warn("Test warning"),
                    child: const Text("Test warn log"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => PlutoLogger.error("Test error"),
                    child: const Text("Test error log"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => PlutoLogger.fatal("Test fatal"),
                    child: const Text("Test fatal log"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: throwError,
                    child: const Text("Test throw exception"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Pluto.instance.crash();
                    },
                    child: const Text("Test crash app"),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Test logging of different types"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () =>
                        PlutoLogger.info(["item 1", "item 2", "item 3"]),
                    child: const Text("Test log list"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => PlutoLogger.info(Text("Text")),
                    child: const Text("Test log Text widget"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => PlutoLogger.info(Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(color: Colors.amber),
                      child: ElevatedButton(
                        onPressed: () => PlutoLogger.debug("test"),
                        child: const Text("Test log Container widget"),
                      ),
                    )),
                    child: const Text("Test log Container widget"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => PlutoLogger.info(() => "function output"),
                    child: const Text("Test log function"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
