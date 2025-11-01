import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:fluent_window/fluent_window.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // This comes from Flutter Acrylic
  await Window.initialize();

  if (Platform.isWindows) {
    await Window.hideWindowControls();
  }

  runApp(const MyApp());

  if (!Platform.isMacOS) {
    // This comes from Bitsdojo Window
    doWhenWindowReady(() {
      appWindow
        ..minSize = Size(200, 360)
        ..size = Size(1300, 800)
        ..alignment = Alignment.center
        ..show();
    });
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Example App',

      theme: FluentThemeData(
        brightness: Brightness.dark,
        // Important if you want to use a Scaffold and have Flutter Acrylic's effects
        scaffoldBackgroundColor: Colors.transparent,
      ),
      home: FluentWindow(
        title: "Example App",
        menuBar: null,
        windowsEffect: WindowEffect.acrylic,
        windowsEffectColor: const Color(0xAF000000),
        child: Center(child: Text("Example App")),
      ),
    );
  }
}
