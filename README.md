This is a simle custom window for the [FluentUI](https://pub.dev/packages/fluent_ui) design using [Bitsdojo Window](https://pub.dev/packages/bitsdojo_window) and [Flutter Acrylic](https://pub.dev/packages/flutter_acrylic).
It works on Windows, Linux and MacOS, but it's naturally the best on Windows.

## Features

- No OS-TitleBar
- Background blur and other transparency effects
- Custom window controls

## Getting started

First, setup [Bitsdojo Window](https://pub.dev/packages/bitsdojo_window), then just wrap your content in FluentWindow.

## Usage

```dart
import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';

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
        ..minSize = Size(640, 360)
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
        title: // Optional, the title of you App if you want to show one.
               // It will appear on the far left next to the MenuBar
        menuBar: // Optional, this will appear next to the title. Intended for the fluent_ui MenuBar,
                 // but you can add your own custom one if you want ,
        child: // Your Flutter App,
      ),
    );
  }
}
```

## Additional information

If you find issue's or have feature request, open an issue on the [Git Repo](https://github.com/4A6F6F6E61/fluent_window.git).
