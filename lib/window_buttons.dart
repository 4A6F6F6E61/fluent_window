import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/widgets.dart';
import 'package:fluent_window/theme.dart';

class WindowButtons extends StatefulWidget {
  const WindowButtons({super.key});

  @override
  State<WindowButtons> createState() => _WindowButtonsState();
}

class _WindowButtonsState extends State<WindowButtons> {
  void maximizeOrRestore() {
    setState(() {
      appWindow.maximizeOrRestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: windowButtonColors),
        appWindow.isMaximized
            ? RestoreWindowButton(colors: windowButtonColors, onPressed: maximizeOrRestore)
            : MaximizeWindowButton(colors: windowButtonColors, onPressed: maximizeOrRestore),
        CloseWindowButton(colors: closeWindowButtonColors),
      ],
    );
  }
}
